# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname='blather-git'
_pkgname=blather
pkgver=20150830
pkgrel=1
pkgdesc="Python application for speech recognition using pocketsphinx and gstreamer. - latest git revision"
arch=('any')
url="https://gitlab.com/jezra/blather"
license=('GPL3')
depends=('python2' 'pocketsphinx' 'gstreamer' 'gstreamer0.10-python')
provides=('blather')
install=blather.install
source=($_pkgname.desktop)
md5sums=('efcf40264e5d4cccea06ad7676ab2393')
optdepends=('pyside' 'pygtk')
makedepends=('git')



_gitroot="https://gitlab.com/jezra/blather.git"

_gitname="blather"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  
  cd "$srcdir/$_gitname"
  

}

package() {
	mkdir -p "$pkgdir/usr/share/blather" || return 1
	mkdir -p "$pkgdir/usr/bin/" || return 1
	mkdir -p "$pkgdir/usr/share/pixmaps/" || return 1
	rm -r "$srcdir/$_gitname/.git" && cp -a ./ "$pkgdir/usr/share/" || return 1
	ln -sf /usr/share/blather/Blather.py "$pkgdir/usr/bin/Blather" || return 1
	install -m 644 $srcdir/$_pkgname/assets/blather.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -Dm644 $startdir/$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
	python2 -m compileall "$pkgdir/usr/share/Blather"

    
    } 

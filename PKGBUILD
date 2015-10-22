# Maintainer: Christopher Hamilton <marker5a@gmail.com>

pkgname=easyterm
pkgver=0.9
pkgrel=1
pkgdesc='Serial Port Terminal Emulator'
arch=('x86_64' 'i686')
url='http://sourceforge.net/projects/easyterm/'

license=('GPLv3')
depends=('qt5')
depends=()
makedepends=('git' 'qt5-serialport')
optdepends=()
provides=()
conflicts=()
source=()
md5sums=()
_gitroot="http://git.code.sf.net/p/easyterm/code easyterm"
_gitname="easyterm"

build() {
  cd ${srcdir}/
  
  msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot}
    fi
  
  cd "$srcdir/$_gitname"
    
  
  qmake .
  make
}

package() {
	echo "$srcdir/$_gitname"
	
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	mkdir -p "$pkgdir/usr/share/applications"
	
	cp "$srcdir/$_gitname/release/EasyTerm" "$pkgdir/usr/bin"
	cp "$srcdir/$_gitname/resources/easyterm.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	cp "$srcdir/$_gitname/easyterm.desktop" "$pkgdir/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:

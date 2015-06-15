# Contributor: Max Devaine <max@devaine.cz>

pkgname=code-eli-git
pkgver=20140913
pkgrel=1
pkgdesc='Collection of C++ libraries that provide a variety of functionalities.'
arch=(i686 x86_64)
url='https://github.com/ddmarshall/Code-Eli'
license=('EPL 1.0')
makedepends=('cmake' 'git')
depends=('')
provides=('code-eli')
conflicts=('')
groups=('')

_gitroot="https://github.com/ddmarshall/Code-Eli.git"
_gitname="Code-Eli"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  msg "Configure Code-Eli..."
  cd "$srcdir/$_gitname/"

  cmake . -DCMAKE_PREFIX_PATH='/usr' -DCMAKE_INSTALL_PREFIX='/usr'
  
}


package() {
  mkdir $pkgdir/usr
  cp -a $srcdir/$_gitname/include $pkgdir/usr/
  chown -R root:root $pkgdir/usr
  chmod -R 755 $pkgdir/usr
}


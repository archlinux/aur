# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>

_gitname=CuteMarkEd
pkgname=cutemarked-git
pkgver=0.10.1.r94.g73adcab
pkgrel=1
pkgdesc="Qt Markdown Editor"
url="https://github.com/cloose/CuteMarkEd"
arch=('i686' 'x86_64')
license=( "GPL2" )
depends=( "qt5-webkit" "hunspell" "discount>=2.1.7" )
makedepends=( 'git' 'qt5-tools' )
provides=('cutemarked')
conflicts=('cutemarked')
source=( "git://github.com/cloose/CuteMarkEd.git" )
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  git describe --tags --long | sed -r "s/^v//;s/([^-]*-g)/r\\1/;s/-/./g"
}

prepare() {
  cd $srcdir/$_gitname
  mkdir -p build
}

build() {
  cd $srcdir/$_gitname/build
  
  qmake ..
  make
}

package() {
  cd $srcdir/$_gitname/build
  make INSTALL_ROOT="$pkgdir" install
}

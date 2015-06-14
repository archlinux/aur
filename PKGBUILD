# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>

_gitname=CuteMarkEd
pkgname=cutemarked-git
pkgver=0.0.0
pkgrel=2
pkgdesc="Qt Markdown Editor"
url="https://github.com/cloose/CuteMarkEd"
arch=('i686' 'x86_64')
license=( "GPL2" )
depends=( "qt5-webkit" "hunspell" "discount>=2.1.7" "desktop-file-utils" "hicolor-icon-theme")
makedepends=( 'git' 'qt5-tools' )
provides=('cutemarked')
conflicts=('cutemarked')
source=( "git://github.com/cloose/CuteMarkEd.git"
         "$pkgname.install")
md5sums=('SKIP'
         'c864bddb8fb532fe2ac27cd20de55b10')
install=$pkgname.install

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

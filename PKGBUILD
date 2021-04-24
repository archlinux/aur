# Contributor: SanskritFritz (gmail)
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=copyq-git
pkgver=r5499.9c53b6ac
pkgrel=1
epoch=1
pkgdesc="Clipboard manager with searchable and editable history."
url="https://github.com/hluk/CopyQ"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('hicolor-icon-theme' 'libxtst' 'qt5-script' 'qt5-svg' 'qt5-x11extras' 'desktop-file-utils' 'knotifications')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'qt5-tools')
optdepends=('copyq-plugin-itemweb-git')
provides=('copyq')
conflicts=('copyq')
source=("$pkgname::git+https://github.com/hluk/CopyQ.git")
md5sums=('SKIP')
install=

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_WEBKIT=0 \
        -DWITH_QT5=TRUE $srcdir/$pkgname
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}


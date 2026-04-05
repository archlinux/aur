# Maintainer: Sherdorbek <your-email@example.com>
pkgname=pdfview-git
pkgver=r2.815795f
pkgrel=1
pkgdesc="A lightweight PDF viewer using Qt6 and Poppler"
arch=('x86_64')
url="https://github.com/Sherdorbek/Oddiypdf"
license=('GPL3') # Update this if the license differs
depends=('qt6-base' 'poppler-qt6')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Sherdorbek/Oddiypdf.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S "$srcdir/${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

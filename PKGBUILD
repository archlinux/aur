# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >
# Contributor: xylosper <darklin20@gmail.com>
# Contributor: Martin T. H. Sandsmark <martin.sandsmark@kde.org>

pkgname=okular-backend-mupdf-git
pkgver=r78.7b2858a
pkgrel=1
pkgdesc="MuPDF-based backend for Okular (git version)"
arch=('i686' 'x86_64')
license=('AGPL')
depends=('okular')
makedepends=('extra-cmake-modules' 'cmake' 'git' 'libmupdf')
url="https://github.com/sandsmark/okular-backend-mupdf"
source=("git+$url")
sha1sums=('SKIP')
conflicts=("okular-backend-mupdf")
provides=("okular-backend-mupdf")

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

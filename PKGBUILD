# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=1.0
_ver=v$pkgver
pkgrel=1
pkgdesc="Kraft helps you to handle documents like quotes and invoices in your small business."
arch=('x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=('akonadi-contacts' 'akonadi' 'ctemplate')
optdepends=(
	'python-reportlab: default PDF generator'
	'python-pypdf2: default PDF generator'
	'python-weasyprint: alternative PDF generator'
)
makedepends=('cmake' 'extra-cmake-modules' 'asciidoctor' 'po4a')
source=(
  "kraft-v${pkgver}.tar.gz::https://github.com/dragotin/kraft/archive/${_ver}.tar.gz"
)


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
                          patch -p1 < "${srcdir}/${s}"
          esac
  done

  rm -rf build
  mkdir -p build
  cd build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ".." \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('b122c5e2be40c76016bc809596779bb156d94ef10d4279cc24c33d598b5e06e4')

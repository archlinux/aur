# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Snaipe

pkgname=criterion
pkgver=2.3.3
pkgrel=1
pkgdesc="A KISS, non-intrusive unit testing framework for C and C++"
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/${pkgname}.git"
license=('MIT')
depends=('gettext' 'nanomsg' 'libcsptr')
makedepends=('cmake')
checkdepends=('python-cram')
source=("https://github.com/Snaipe/Criterion/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('8c85e1fcdb9a39b82bee50394bedfe74a0c839ffff129ddfc6fb73b11adafa29')

build() {
  cd "${pkgname}-v${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCTESTS=ON -S . -B build
  cmake --build build
}

check() {
  cd "${pkgname}-v${pkgver}"
  cmake --build build --target criterion_tests test
}

package() {
  cd "${pkgname}-v${pkgver}"
  cmake --build build --target install -- DESTDIR="$pkgdir/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: agony <27015 at riseup dot net>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=wal2json
pkgver=2.7
pkgrel=1
pkgdesc="Output plugin for logical decoding PostgreSQL WAL's"
arch=(i686 x86_64)
url="https://github.com/eulerto/wal2json"
license=('BSD-3-Clause')
depends=('postgresql>=9.4')
makedepends=('llvm')
install="wal2json.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgname}_${pkgver//./_}.tar.gz"
        "wal2json.install")
sha256sums=('e6c12d02dc32e4d610dce33ee52ea85a54e12a563e79c4844508b6c061ff07a1'
            '4dcef8c4e2c6badb3c68af16235632b042e867cbef0beecac4734acb53f7915c')

build() {
  cd "${pkgname}-${pkgname}_${pkgver//./_}"
  USE_PGXS=1 make
}

package() {
  cd "${pkgname}-${pkgname}_${pkgver//./_}"
  USE_PGXS=1 make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}


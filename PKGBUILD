# Maintainer: Bram Swenson <bram at craniumisajar dot com> PGP-Key: 9E93532D99D643C0

pkgname=zcash
pkgver=v1.0.2
pkgrel=1
pkgdesc="Zcash is a decentralized and open-source cryptocurrency that offers privacy and selective transparency of transactions."
arch=('any')
url="https://z.cash"
license=(MIT)
makedepends=('tar' 'git' 'wget')
provides=('zcash')
source=("https://github.com/zcash/zcash/archive/${pkgver}.tar.gz")
sha256sums=('2c49d9e5af33fae8557915cdc05f5ef41d512c0dc88fcf44d546f642402fa85c')
install="${pkgname}.install"
_srcname=zcash-1.0.2

pkgver() {
  echo ${pkgver}
}

build() {
  cd $_srcname
  ./zcutil/build.sh -j$(nproc)
}

package() {
  cd $_srcname
  install -Dm755 zcutil/fetch-params.sh "${pkgdir}/usr/bin/zcash-fetch-params"
  install -Dm755 src/zcash-cli "${pkgdir}/usr/bin/zcash-cli"
  install -Dm755 src/zcashd "${pkgdir}/usr/bin/zcashd"
}

# vim:set ts=2 sw=2 et:

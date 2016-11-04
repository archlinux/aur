# Maintainer: Bram Swenson <bram at craniumisajar dot com> PGP-Key: 9E93532D99D643C0

pkgname=zcash
pkgver=v1.0.1
pkgrel=1
pkgdesc="Zcash is a decentralized and open-source cryptocurrency that offers privacy and selective transparency of transactions."
arch=('any')
url="https://z.cash"
license=(MIT)
makedepends=('tar' 'git' 'wget')
provides=('zcash')
source=("https://github.com/zcash/zcash/archive/${pkgver}.tar.gz")
sha256sums=('45d52b384869e89d686dbd780ac1aea3f1db820cc63eddfc9fe4cfa0b788d5db')
install="${pkgname}.install"
_srcname=zcash-1.0.1

pkgver() {
  echo ${pkgver}
}

build() {
  cd $_srcname
  ./zcutil/build.sh -j$(nproc)
}

package() {
  cd $_srcname
  install -Dm755 zcutil/fetch-params.sh "${pkgdir}/usr/bin/zcutil-fetch-params"
  install -Dm755 src/zcash-cli "${pkgdir}/usr/bin/zcash-cli"
  install -Dm755 src/zcashd "${pkgdir}/usr/bin/zcashd"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Bram Swenson <bram at craniumisajar dot com> PGP-Key: 9E93532D99D643C0

pkgname=zcash
pkgver=v1.0.0
pkgrel=1
pkgdesc="Zcash is a decentralized and open-source cryptocurrency that offers privacy and selective transparency of transactions."
arch=('any')
url="https://z.cash"
license=(MIT)
makedepends=('tar' 'git')
provides=('zcash')
source=("https://github.com/zcash/zcash/archive/v1.0.0.tar.gz")
sha256sums=('de4a7d2b7ae4c4487ecf63c8c251a29c9d003922a25e45d748a80141415a732d')
install="${pkgname}.install"
_srcname=zcash-1.0.0

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

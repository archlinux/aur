# Maintainer: Bram Swenson <bram at craniumisajar dot com> PGP-Key: 9E93532D99D643C0

pkgname=zcash
pkgver=e7183d8
pkgrel=1
pkgdesc="Decentralized and open source cryptocurrency"
arch=('any')
url="https://z.cash"
license=(MIT)
makedepends=('tar')
provides=('zcash')
source=("https://github.com/zcash/zcash/archive/v1.0.0-rc4.tar.gz")
sha256sums=('8ab6b552ef2c4df4aaaa8e065a5ef00fdfb68875295f35e1a87093575b5029f5')
install="${pkgname}.install"
_srcname=zcash-1.0.0-rc4

pkgver() {
  cd $_srcname
  echo $(git describe --always | sed 's/-/./g')
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

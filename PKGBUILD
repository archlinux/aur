# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=apkeep-bin
pkgver=1.0.0
pkgrel=2
pkgdesc='CLI tool from EFF for downloading APK files from various sources'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/EFForg/apkeep'
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
provides=('apkeep')
conflicts=('apkeep')
options=('!debug')

source=("LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE")
sha256sums=('335c6d84628245ca74629ebc030948ad640e5411a559f926aed421a4d0d829e3')
sha256sums_x86_64=('a23579a3ba366d25a6d69848189b983d65662f4ecf4b9e11e16510811659de4e')
sha256sums_aarch64=('5410acebd1b69427adcf98ccfdda6fa4dd3201e0540e5e2c01037b68e0a84049')
sha256sums_armv7h=('c561060b6e0bdf0b080c8d0c58253281dd2a080001e6564e70ee45e8be5da8eb')
sha256sums_i686=('194351b2ad857332a34cfded760955b5a339e875a50dc2fe5b5786b33e9d7d2c')

source_x86_64=("apkeep-${pkgver}-x86_64::${url}/releases/download/${pkgver}/apkeep-x86_64-unknown-linux-gnu")

source_aarch64=("apkeep-${pkgver}-aarch64::${url}/releases/download/${pkgver}/apkeep-aarch64-unknown-linux-gnu")

source_armv7h=("apkeep-${pkgver}-armv7h::${url}/releases/download/${pkgver}/apkeep-armv7-unknown-linux-gnueabihf")

source_i686=("apkeep-${pkgver}-i686::${url}/releases/download/${pkgver}/apkeep-i686-unknown-linux-gnu")

latestver() {
    gh api --paginate repos/EFForg/apkeep/releases \
        --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "apkeep-x86_64-unknown-linux-gnu") and any(.assets[]; .name == "apkeep-aarch64-unknown-linux-gnu") and any(.assets[]; .name == "apkeep-armv7-unknown-linux-gnueabihf") and any(.assets[]; .name == "apkeep-i686-unknown-linux-gnu")) | .tag_name' \
    | sort -V | tail -1
}

package() {
    install -Dm755 "apkeep-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/apkeep"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

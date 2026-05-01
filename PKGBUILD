# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=apkeep-bin
pkgver=1.0.0
pkgrel=1
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
sha256sums_x86_64=('d6584d0d03078ae0a4969f23e45ed5637242c7b552f5573e2064182f67f50278')
sha256sums_aarch64=('1c3001163b15c48829df185b68facce892432a256f7643ad5c5a3a1f05aacef4')
sha256sums_armv7h=('c705b61a2a57e4d26cde5793899a963e1760b8f8df1e93d73c0d98c9986364bd')
sha256sums_i686=('714d58bb7f74ea012b3ea7e4ec653b5be2f72f3e301b10c42dfdc50336e2ca37')

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

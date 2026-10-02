# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=apkeep-bin
pkgver=1.1.0
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
sha256sums_x86_64=('badd7ad9fa7d2f32abe01eaf33b7ff086361a95bbc000a33bf44b630d4bf2140')
sha256sums_aarch64=('1a2e959842bbca4bc8db455b8132cc6f37534d70f2384409096268d8fc442ae8')
sha256sums_armv7h=('570e28e399bed789e95831938b795eada4a28a7d5b8c2ecae343ac7f1a73381e')
sha256sums_i686=('bb83499cf0bc9dfe7a8dbbed28930cbd6714e2de1070c4711ee8d604bb92934c')

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

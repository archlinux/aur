# Maintainer 2021-2021: 4679 <4679@pm.me>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
# Co-Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=shadowsocks-rust-bin
pkgver=1.14.3
pkgrel=4
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/ (binary version)'
arch=('x86_64' 'arm' 'aarch64')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('gcc-libs')
provides=('shadowsocks-rust')
conflicts=('shadowsocks-rust')
source=(
    "${url}/raw/v${pkgver}/LICENSE"
    "${url}/raw/v${pkgver}/examples/config.json"
    "${url}/raw/v${pkgver}/examples/config_ext.json"
    'shadowsocks-rust@.service'
    'shadowsocks-rust-server@.service'
)
source_x86_64=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.x86_64-unknown-linux-gnu.tar.xz")
source_arm=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.arm-unknown-linux-gnueabi.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.aarch64-unknown-linux-gnu.tar.xz")

sha512sums=(
    '6d7014061bf4014faec823aa1da91f990d034c21005cbee30de7ee62744201fba7d09d58a9e536d8e63bfa6fe951107ee68482b583d887b6e358f3c3eec89b85'
    '9a0b81d82bf897c5461d75d941cd604cbd7f32d00c2bf775f17b37b77fcf5734903d2ec666ba9a6a340e77f31018b5dbbb8ea597797c6a00c6b1f3e2f47127e6'
    '4ac52e6fe04e02543f54d57fccfd863f18b157fd28fb61c9a56ba46269b9dff410a80960943d911afa55b45c3fc42e98d91f8bb75e9103abf3f3dbfffb73a6e0'
    '061e0dc9af84242aeec75df5c290d3c6f16950a2e664898eb7ad50daec94f04ef84b634d4e4f46a58b6512801c4e134f97c6616c538cabc5d008d1fd629c3571'
    '4d45ff086b8aa75343518141c02aeb6b4dbdb9f2e0f835ab5f11bbe2dc60e35802704f488db88d79c4412712e9b7a8957df605b0cb961c764eb66fc734655fe3'
)
sha512sums_x86_64=('e43523d9ea7cab08a3634a7df38c51b7121f205bc1318c577233ef7004e82efb0152883eec40658f731719707577a0381e09557bc407890966f1feb886527e33')
sha512sums_arm=('6ae0001efcc58756e06889c65165b78baa2a0a061af428cc57cd9b24b258966c6d755e9d5f87a88e4ebd4b499104edc335e6c9736d78afd46b114a6ecfd8db37')
sha512sums_aarch64=('2cd040b43f1e76b46d4d25be5ddc76805dc6e64016ad676c6281f44ce65fa1993294b076ff48a35007c30de69c098b4ca07d0dcd7f9917af2b852baa2caa8f47')

package() {
    cd "${srcdir}"
    install -Dm755 sslocal "${pkgdir}/usr/bin/sslocal"
    install -Dm755 ssserver "${pkgdir}/usr/bin/ssserver"
    install -Dm755 ssurl "${pkgdir}/usr/bin/ssurl"
    install -Dm755 ssmanager "${pkgdir}/usr/bin/ssmanager"
    install -Dm755 ssservice "${pkgdir}/usr/bin/ssservice"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 config.json "${pkgdir}/etc/shadowsocks/config_rust.json.example"
    install -Dm644 config_ext.json "${pkgdir}/etc/shadowsocks/config_ext_rust.json.example"
    install -Dm644 shadowsocks-rust@.service "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust@.service"
    install -Dm644 shadowsocks-rust-server@.service "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-server@.service"
}

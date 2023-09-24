# Maintainer 2021-2021: 4679 <4679@pm.me>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
# Co-Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=shadowsocks-rust-bin
_pkgname=shadowsocks-rust
pkgver=1.16.2
pkgrel=1
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/ (binary version)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('gcc-libs')
provides=('shadowsocks' "${_pkgname}")
conflicts=('shadowsocks' "${_pkgname}" "${_pkgname}-git")
source=(
    "${url}/raw/v${pkgver}/LICENSE"
    'shadowsocks-rust@.service'
    'shadowsocks-rust-server@.service'
    "${url}/raw/v${pkgver}/examples/config.json"
    "${url}/raw/v${pkgver}/examples/config_ext.json"
)
source_x86_64=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.x86_64-unknown-linux-gnu.tar.xz")
source_armv7h=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.arm-unknown-linux-gnueabihf.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.aarch64-unknown-linux-gnu.tar.xz")

b2sums=('98280467eaac88ca227a95753e376e8fda028da2a651051d23012f8538e3fe754c55b26d0321fea2017cb9a815c8df4242f69f6ae57eb84a450a77eb704569e2'
        '0319f41bc6c547a4c9703f0067c927374d99d22213e5ba09ca043b9277aff355ad3eda0484207b585d6c192eb043ca915527a6cccb57da2a9eca43076224f6d4'
        '82c6072fa49f11fd134ceb7eae1bfc694cb6d6bbe8ae9049cc678f512f57f55c998fc7ff161b53c3e0f6756e742f2e41db2a959d62802b179d500d067c84ed48'
        '20f097921a0d691cc737d724f137a55be2f0f4c390be7c4de472e20235a9e3b5b2c4e9c64f3adb97d38f50d29e08d0d1077c2f63afe2dc0130d519c70f07efce'
        '157e38b6d06c2cd7f32a9684241bbd452925f454c12942ff92d0b82f16adfd06cd9fc86bcd4991bf5e41d6e0864e6244cdef271ce28005e36bdac5c6a9d1bb49')
b2sums_x86_64=('a54c393bc4df130b90b232edc2d7bc150f8471f990d54d80ad266738be13cf1e7b2828c43eaadeb7623c6a39a9e35905ed75f4681ee24c91ac5273250592e1bf')
b2sums_armv7h=('b8a91aab28c05798c787fb7ebb2680345960efd761993f4d7bd5817065dc457d078d6bdd3dbe1df8f3ae96a252094cf260e706ee6c195062df7cc3f8f0b14e5f')
b2sums_aarch64=('2532cc46974520e7eea2e2933c21a64e5c5875a821d64148120be58e2f3e11b9ebc6a44adaea5d03557bdc3fb0ba80418e3a9f54f1c5964ed65dd0a39c533a48')

package() {
    cd "${srcdir}"
    install -Dm755 -t "${pkgdir}/usr/bin" sslocal ssserver ssurl ssmanager ssservice
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" shadowsocks-rust@.service shadowsocks-rust-server@.service

    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE

    install -Dm644 config.json "${pkgdir}/etc/shadowsocks-rust/config_rust.json.example"
    install -Dm644 config_ext.json "${pkgdir}/etc/shadowsocks-rust/config_ext_rust.json.example"
}

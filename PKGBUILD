# Maintainer 2021-2021: 4679 <4679@pm.me>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
# Co-Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=shadowsocks-rust-bin
_pkgname=shadowsocks-rust
pkgver=1.17.0
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
b2sums_x86_64=('4c489665a6626758cc4e12fb06c0b0654812c3642c3a316695fc6c4b46c4f63dcf6ecdffbdb39f6a697e3a2b412cca7ee9ae63ed441aee67ab84b181e410d0aa')
b2sums_armv7h=('30602f75519463fa69c047c0a60cc4a039c9a5400efb1b5cc1f38507e0b13258a17b75242a65f7b81355e88da3bca136b36ae372d19fad8e629933c5c8affa6c')
b2sums_aarch64=('4b09026751e5c304c811e58dc5bfad70dce2c19adf44b989c1c404ada660db2f7e447624e1e1178da8db932613a0f12639e315c294ad4a1108e21146aca4bd67')

package() {
    cd "${srcdir}"
    install -Dm755 -t "${pkgdir}/usr/bin" sslocal ssserver ssurl ssmanager ssservice
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" shadowsocks-rust@.service shadowsocks-rust-server@.service

    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE

    install -Dm644 config.json "${pkgdir}/etc/shadowsocks-rust/config_rust.json.example"
    install -Dm644 config_ext.json "${pkgdir}/etc/shadowsocks-rust/config_ext_rust.json.example"
}

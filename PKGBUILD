# Maintainer 2021-2021: 4679 <4679@pm.me>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
# Co-Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=shadowsocks-rust-bin
_pkgname=shadowsocks-rust
pkgver=1.15.4
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

sha512sums=('6d7014061bf4014faec823aa1da91f990d034c21005cbee30de7ee62744201fba7d09d58a9e536d8e63bfa6fe951107ee68482b583d887b6e358f3c3eec89b85'
            '1aa9e629bb3bf3bbf834cb1b8fe96ed86d400e60c95294b0f67f5b4d7a897ea9acfff6744b457b2850c397f97cd284c8d7fff5de555e5b11740733cd96f809a2'
            'd52ea3fa8f0673a831db33557e1b1aae2b2ddde91e03e86a69f6bde4ba714d63fea277de314693cb6a941fe5745b945ca1b688b86180fb8e2707cdecc1eb9445'
            '9a0b81d82bf897c5461d75d941cd604cbd7f32d00c2bf775f17b37b77fcf5734903d2ec666ba9a6a340e77f31018b5dbbb8ea597797c6a00c6b1f3e2f47127e6'
            '4ac52e6fe04e02543f54d57fccfd863f18b157fd28fb61c9a56ba46269b9dff410a80960943d911afa55b45c3fc42e98d91f8bb75e9103abf3f3dbfffb73a6e0')
sha512sums_x86_64=('5508d996f0e82ddd99779c8d2cd086455a28fb7ff4712ed2642dfde758a70edce277370c45deaeccb937717a2ab4936553c150844ec5ff7ce4e318782d736b6c')
sha512sums_armv7h=('034aed1a50e6af6e88826ca7669ef9429af01f026723894cabe98786946c77876d7a9b973682837bb84b39f716314f4f892536c1cc3cc3745e20cc1e618a692e')
sha512sums_aarch64=('627d45862009b26e20f6a9d4bfd19cfc66d1af24135e6ab8434eca92c586d0d3c0bd7ccef7fbf2795ba6fead758da7dbb0b12def79ca65e604f7eef8b14ac41f')

package() {
    cd "${srcdir}"
    install -Dm755 -t "${pkgdir}/usr/bin" sslocal ssserver ssurl ssmanager ssservice
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" shadowsocks-rust@.service shadowsocks-rust-server@.service

    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE

    install -Dm644 config.json "${pkgdir}/etc/shadowsocks-rust/config_rust.json.example"
    install -Dm644 config_ext.json "${pkgdir}/etc/shadowsocks-rust/config_ext_rust.json.example"
}

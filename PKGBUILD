# Maintainer 2021-2021: 4679 <4679@pm.me>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
# Co-Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=shadowsocks-rust-bin
_pkgname=shadowsocks-rust
pkgver=1.15.1
pkgrel=1
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/ (binary version)'
arch=('x86_64' 'arm' 'aarch64')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=(
    "${url}/raw/v${pkgver}/LICENSE"
    'shadowsocks-rust-local@.service.system'
    'shadowsocks-rust-server@.service.system'
    'shadowsocks-rust-local@.service.user'
    'shadowsocks-rust-server@.service.user'
    "${url}/raw/v${pkgver}/examples/config.json"
    "${url}/raw/v${pkgver}/examples/config_ext.json"
)
source_x86_64=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.x86_64-unknown-linux-gnu.tar.xz")
source_arm=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.arm-unknown-linux-gnueabi.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.aarch64-unknown-linux-gnu.tar.xz")

sha512sums=(
    '6d7014061bf4014faec823aa1da91f990d034c21005cbee30de7ee62744201fba7d09d58a9e536d8e63bfa6fe951107ee68482b583d887b6e358f3c3eec89b85'
    '87e637edaa601da208366806fb8e16f6783b2b2f066b17c453274153b91ead66eea6caae9f82c3e2118bce3230d0812a47e540670c219bcc49d2296a102cf1dd'
    'fcc40b1c864179916c1691b57e98fd8e1519047b87ea5b37dba52fd340869208f493f0c83e941dcfd5de22851db1302d97765e9ddcd5174fd8b1fabece5e1963'
    '2d00ac1570f00c9c0c29cd9011d3071b81fb73f48cfbb3526eda4c38674561041192f5760569360fa6fb14d67ee29dfa15bab6f1c044a17c8eb32014cc8e1c9e'
    '3fad96b4851996de86c316fac56597d768fbc8fc5fdb1a0d285b0cfdb474dfcc9834e459f40e2a1b76d2ee3bf14bced3eb99244bdbb09784f7bd4f43befd77b2'
    '9a0b81d82bf897c5461d75d941cd604cbd7f32d00c2bf775f17b37b77fcf5734903d2ec666ba9a6a340e77f31018b5dbbb8ea597797c6a00c6b1f3e2f47127e6'
    '4ac52e6fe04e02543f54d57fccfd863f18b157fd28fb61c9a56ba46269b9dff410a80960943d911afa55b45c3fc42e98d91f8bb75e9103abf3f3dbfffb73a6e0'
)
sha512sums_x86_64=('5df925373be75e599e76ecc2830f0f59d672efb0ae4c4f0c2870fc92375a3de5f80a87da97907509e95de7543061cb269c50d948f62b511205c593eb3933a7c0')
sha512sums_arm=('86e1b309042d4e465f9c53ff00c82cb71089e6f1e0dc8523cf3405325704c79dd617a5ac3512d1701380f6fe55c4138dd0378d3f84118766217ca4fca5ca63ac')
sha512sums_aarch64=('26dd598948b6c41cb5a9f069ea812b128bd1a63972c8b01e52d1ed175829b0bba77e787821803384e681ccf7c2bf14496e87fc367fa9bab34af9f7223e9ea55b')

package() {
    cd "${srcdir}"
    install -Dm755 -t "${pkgdir}/usr/bin" sslocal ssserver ssurl ssmanager ssservice

    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE

    install -Dm644 shadowsocks-rust-local@.service.system "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-local@.service"
    install -Dm644 shadowsocks-rust-server@.service.system "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-server@.service"
    install -Dm644 shadowsocks-rust-local@.service.user "${pkgdir}/usr/lib/systemd/user/shadowsocks-rust-local@.service"
    install -Dm644 shadowsocks-rust-server@.service.user "${pkgdir}/usr/lib/systemd/user/shadowsocks-rust-server@.service"

    install -Dm644 config.json "${pkgdir}/etc/shadowsocks-rust/config_rust.json.example"
    install -Dm644 config_ext.json "${pkgdir}/etc/shadowsocks-rust/config_ext_rust.json.example"
}

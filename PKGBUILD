# Maintainer 2021-2021: 4679 <4679@pm.me>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
# Co-Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=shadowsocks-rust-bin
_pkgname=shadowsocks-rust
pkgver=1.15.2
pkgrel=3
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
    'eb8d7e0b0ac230903cbc8079443774180c99ac4190fa948f7982ebd05b9fc5188d908d8c6b906815e43e75bd826118a6fc379d90dc69961192d493f53a4539cb'
    '7cba7af4f57df2b2b8f7c08a716ac9cff70a498a54b27feefe28d663c514c0e67ed84a6d1555742780b50eac95e0443e229a241c4c96b59ff2c42638918f5fb3'
    'b2ba45735ae5d9ade56776d67bf0701cc16e4151ecabc1421c6f4dbbd42e52ce1c7cc6d7fa345c90efb99f2cc657d7150e9ccaa8189c537231e58bb6a5c180da'
    '638eade59ae97e8b08a4a24886fed9f7e7abce91e1bc0f457f2705775621bff7780d77a25d5dfea7ab7b6f187ae0de59c215cccda34ade4ca3bc2da7229f8e22'
    '9a0b81d82bf897c5461d75d941cd604cbd7f32d00c2bf775f17b37b77fcf5734903d2ec666ba9a6a340e77f31018b5dbbb8ea597797c6a00c6b1f3e2f47127e6'
    '4ac52e6fe04e02543f54d57fccfd863f18b157fd28fb61c9a56ba46269b9dff410a80960943d911afa55b45c3fc42e98d91f8bb75e9103abf3f3dbfffb73a6e0'
)
sha512sums_x86_64=('85653b00b230e59b74ad680500a76833381566b1118d2ff5bff3f42dadaf68ef737cc81bc4127c4cbc13dc72354a49ec797ffad485919f90a56b7a6ad1a1bf1a')
sha512sums_arm=('02f135d3b41d8c08a39e5dea809e7141690298d637368b42490726e371c3a24ac390e549d7ecef8fc527b6081377a70e5b99e4148c192a2f61390e7d826c516b')
sha512sums_aarch64=('bac69b6831eb7b02e62174aff2ca1854aaacc61976b7b17ee63cb366b7b96477701b450967503ced77233dffda80792248c65c6fc8dba10aaaeccbc0b11e5895')

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

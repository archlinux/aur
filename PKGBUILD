# Maintainer: Relwi <theofficialdork@hotmail.com>
_pkgname=oxidize
pkgname="${_pkgname}bot-bin"
pkgver=1.3.5
pkgrel=2
pkgdesc='High performance Twitch bot in Rust.(Prebuilt version)'
arch=('x86_64')
url="https://setbac.tv/"
_ghurl="https://github.com/udoprog/OxidizeBot"
license=(
    'Apache-2.0'
    'MIT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'openssl'
    'gcc-libs'
    'zlib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.deb"
    "LICENSE-APACHE-${pkgver}::https://raw.githubusercontent.com/udoprog/OxidizeBot/${pkgver}/LICENSE-APACHE"
    "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/udoprog/OxidizeBot/${pkgver}/LICENSE-MIT"
)
sha256sums=('7cb3a6d1ee56c90d035c381f5ff8b013f89552dc0072e16fb76f28930eb4d860'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'a3b5190576facfdaa65b9e7be47b5713612a2fa8180d83a666a2572993d36542')
prepare() {
    chmod 644 "${srcdir}/data."*
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

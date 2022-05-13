# Maintainer: Sebastian Rutofski <kontakt@sebastian-rutofski.de>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>


pkgname='cookcli-git'
_pkgname="${pkgname%-git}"
arch=('x86_64')
pkgver=0.1.4
pkgrel=1
pkgdesc='CookCLI is provided as a command-line tool to make Cook recipe management easier, and enable automation and scripting workflows for the CookLang ecosystem. Build from source.'
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
url='https://github.com/cooklang/CookCLI'
license=('MIT')
depends=('swift-language' 'libdispatch')

source=("CookCLI_${pkgver}.zip::https://github.com/cooklang/CookCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d6e154a044e4e2e9e8c8cf9bcbaf1729e94916356cd16220eac197e2dbdf7cf8')
check() {
    cd "${srcdir}/CookCLI-${pkgver}"
    ".build/${CARCH}-unknown-linux-gnu/release/cook" recipe read seed/Borsch.cook
}

build() {
    cd "${srcdir}/CookCLI-${pkgver}"
    swift build --configuration release
}

package() {
	rm -f "${pkgdir}/usr/bin/cook"
    install -Dm755 "${srcdir}/CookCLI-${pkgver}/.build/${CARCH}-unknown-linux-gnu/release/cook" "${pkgdir}/usr/bin/cook"
    install -Dm644 "${srcdir}/CookCLI-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
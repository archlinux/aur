# Maintainer: Sebastian Rutofski <kontakt@sebastian-rutofski.de>


pkgname='cookcli-git'
_pkgname="${pkgname%-git}"
arch=('x86_64')
pkgver=0.0.12
pkgrel=1
pkgdesc='CookCLI is provided as a command-line tool to make Cook recipe management easier, and enable automation and scripting workflows for the CookLang ecosystem. Build from source.'
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
url='https://github.com/cooklang/CookCLI'
license=('MIT')
depends=('swift-language')

source=("CookCLI_${pkgver}.zip::https://github.com/cooklang/CookCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aad91ae8c230667d810091e3498fed5d4b88a39979beae9d64bd0fa22bb7e8be')

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
# Maintainer: Sebastian Rutofski <kontakt@sebastian-rutofski.de>


pkgname='cookcli-git'
_pkgname="${pkgname%-git}"
arch=('x86_64')
pkgver=0.0.9
pkgrel=1
pkgdesc='CookCLI is provided as a command-line tool to make Cook recipe management easier, and enable automation and scripting workflows for the CookLang ecosystem. Build from source.'
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
url='https://github.com/cooklang/CookCLI'
license=('MIT')
makedepends=('swift-bin')
checkdepends=('swift-bin')

source=("CookCLI_${pkgver}.zip::https://github.com/cooklang/CookCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a416cbae21d77fdc15f7c8b237f06f9ed3ec657a8c6f23fff5c74b831f95b4a')

check() {
    cd "${srcdir}/CookCLI-${pkgver}"
    ".build/${CARCH}-unknown-linux-gnu/release/cook" recipe read seed/Borsch.cook
}

build() {
    cd "${srcdir}/CookCLI-${pkgver}"
    swift build --configuration release -Xswiftc -static-stdlib
}

package() {
	rm -f "${pkgdir}/usr/bin/cook"
    install -Dm755 "${srcdir}/CookCLI-${pkgver}/.build/${CARCH}-unknown-linux-gnu/release/cook" "${pkgdir}/usr/bin/cook"
    install -Dm644 "${srcdir}/CookCLI-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
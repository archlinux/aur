# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Contributor: tee < teeaur at duck dot com >

_appname=oxfmt
pkgname=${_appname}-bin
pkgver=0.78.0
oxfmt_pkgver=${pkgver}
pkgrel=1
pkgdesc="Oxfmt is a high-performance formatter for the JavaScript ecosystem"

arch=('x86_64' 'aarch64')
url='https://oxc.rs'
license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

optdepends=('oxlint')
depends=('glibc' 'libgcc')

_github_url="https://github.com/oxc-project/oxc/releases/download/${_appname}_v${oxfmt_pkgver}"
_github_url_raw="https://raw.githubusercontent.com/oxc-project/oxc/${_appname}_v${oxfmt_pkgver}"

_binary_x86_64="${_appname}-x86_64-unknown-linux-gnu"
_binary_aarch64="${_appname}-aarch64-unknown-linux-gnu"

source=("README-${pkgver}.md::${_github_url_raw}/README.md"
		"LICENSE-${pkgver}::${_github_url_raw}/LICENSE")
source_x86_64=("${_binary_x86_64}-$pkgver.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}-$pkgver.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums=('91e5c313d8eac4ea611ca2d913cbeaf2338864423a20f0981a36cdfcd868bfe3'
            '95ced5ecf1133fbf41d409b5555c86c344f83f3b019926057ddbc07cfdcc27b3')
sha256sums_x86_64=('ed43ec296f699a5bcbb1c1947e2aeb4271c3674e43dc6db463f8c1da4c9bf15f')
sha256sums_aarch64=('7f90c13c29ff9f8c5f6955bfff9623909cc80ddb2704007249c2532676bd5266')

package() {
    local _binary_var="_binary_${CARCH}"

    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

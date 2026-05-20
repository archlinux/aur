# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Contributor: tee < teeaur at duck dot com >

_appname=oxfmt
pkgname=${_appname}-bin
pkgver=0.51.0
oxlint_pkgver=1.66.0
pkgrel=1
pkgdesc="Oxfmt is a high-performance formatter for the JavaScript ecosystem"

arch=('x86_64' 'aarch64')
url='https://oxc.rs'
license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

optdepends=('oxlint')
depends=('glibc' 'libgcc')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v${oxlint_pkgver}"
_github_url_raw="https://raw.githubusercontent.com/oxc-project/oxc/apps_v${oxlint_pkgver}"

_binary_x86_64="${_appname}-x86_64-unknown-linux-gnu"
_binary_aarch64="${_appname}-aarch64-unknown-linux-gnu"

source=("README-${pkgver}.md::${_github_url_raw}/README.md"
		"LICENSE-${pkgver}::${_github_url_raw}/LICENSE")
source_x86_64=("${_binary_x86_64}-$pkgver.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}-$pkgver.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums=('be81179a34098b624f4b538da1e5b9a34a03ea6725d4002106b7d95a157985aa'
            '95ced5ecf1133fbf41d409b5555c86c344f83f3b019926057ddbc07cfdcc27b3')
sha256sums_x86_64=('73f9509b345d04407c37ce7554a83118a82e43011709c650324c0546b0f38d62')
sha256sums_aarch64=('45cbf3ff497ebdc2118af172a09e4d45b90d1f77b83759f124dd56724f0c011c')

package() {
    local _binary_var="_binary_${CARCH}"

    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

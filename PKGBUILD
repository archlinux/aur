# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Contributor: tee < teeaur at duck dot com >

_appname=oxlint
pkgname=${_appname}-bin
pkgver=1.70.0
oxlint_pkgver=${pkgver}
pkgrel=1
pkgdesc="A high-performance linter for JavaScript and TypeScript built on the Oxc compiler stack"

arch=('x86_64' 'aarch64')
url='https://oxc.rs'
license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

optdepends=('oxfmt')
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
sha256sums_x86_64=('cba0142899d1ed1c79d4ff3a8a6c715cd06b5df74085abb7f5df47fb3fc3a42c')
sha256sums_aarch64=('0a52768ac98831024e0ede1d1a057d7ca2718d7abe6747a97bff87f70dc2de90')

package() {
    local _binary_var="_binary_${CARCH}"

    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

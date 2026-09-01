# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Contributor: tee < teeaur at duck dot com >

_appname=oxlint
pkgname=${_appname}-bin
pkgver=1.81.0
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

sha256sums=('324ce0bf668dd2add5bed0ab6b46cf582c46292e1b88fccb9f82a0d42edd1a56'
            '95ced5ecf1133fbf41d409b5555c86c344f83f3b019926057ddbc07cfdcc27b3')
sha256sums_x86_64=('d176d586ff131466383c70ce655afee7dc5a0f0e8fcbdebc8e1320021431e69c')
sha256sums_aarch64=('e80f0a157a6ebbba332848a19f93f2fe593c42bc69d51d316446ada1ae47abc8')

package() {
    local _binary_var="_binary_${CARCH}"

    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

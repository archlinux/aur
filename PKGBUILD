# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Contributor: tee < teeaur at duck dot com >

_appname=oxfmt
pkgname=${_appname}-bin
pkgver=0.70.0
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

sha256sums=('324ce0bf668dd2add5bed0ab6b46cf582c46292e1b88fccb9f82a0d42edd1a56'
            '95ced5ecf1133fbf41d409b5555c86c344f83f3b019926057ddbc07cfdcc27b3')
sha256sums_x86_64=('7c1051238203be82eb7ed6038a9a72ac258ee15d79510e71ea32665df6b7af9f')
sha256sums_aarch64=('37d4ca4b231c8d6226c9c28088b7c6b18275af1f9f0a3a1f0dcefcf8cde71c09')

package() {
    local _binary_var="_binary_${CARCH}"

    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

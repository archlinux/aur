# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Contributor: tee < teeaur at duck dot com >

_appname=oxlint
pkgname=${_appname}-bin
pkgver=1.94.0
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

_github_url="https://github.com/oxc-project/oxc/releases/download/${_appname}_v${oxlint_pkgver}"
_github_url_raw="https://raw.githubusercontent.com/oxc-project/oxc/${_appname}_v${oxlint_pkgver}"

_binary_x86_64="${_appname}-x86_64-unknown-linux-gnu"
_binary_aarch64="${_appname}-aarch64-unknown-linux-gnu"

source=("README-${pkgver}.md::${_github_url_raw}/README.md"
		"LICENSE-${pkgver}::${_github_url_raw}/LICENSE")
source_x86_64=("${_binary_x86_64}-$pkgver.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}-$pkgver.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums=('96600c08d32b8550b1250500f3a21611b20a3a3c6d262309091195c95520d58e'
            '95ced5ecf1133fbf41d409b5555c86c344f83f3b019926057ddbc07cfdcc27b3')
sha256sums_x86_64=('fc1a189a35417ebda77cac83b8bfe9e9d10a7eb27e0d2fe005d222fa01261e64')
sha256sums_aarch64=('ae4f0f826d3a96f529e197e460c9e4ffb4450528f55f4c688f6f6936f4660159')

package() {
    local _binary_var="_binary_${CARCH}"

    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

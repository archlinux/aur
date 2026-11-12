# Maintainer: Chaser <ch4ser@users.noreply.github.com>

pkgname=devo-bin
pkgver=0.2.19
pkgrel=1
pkgdesc="Open-source, provider-agnostic coding agent that lives in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/7df-lab/devo"
license=('MIT')
depends=('bash')
provides=('devo')
conflicts=('devo')
options=('!strip')

optdepends=(
	'git: inspect and work with Git repositories'
	'github-cli: interact with GitHub'
	'glab: interact with GitLab'
)

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/devo-tui-v${pkgver}-x86_64-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/devo-tui-v${pkgver}-aarch64-linux-musl.tar.gz")

sha256sums_x86_64=('b7922d74c80e07188607dc195054957ffa7b3af3165003ba016ee9b47bae48c7')
sha256sums_aarch64=('33535b11610767d957fe67c3513cd405e84a2d70c6681542f6c921ca0c54c0cc')

package() {
	local _srcdir="${srcdir}/devo-tui-v${pkgver}-${CARCH}-linux-musl"

	install -dm755 "${pkgdir}/opt/devo" "${pkgdir}/usr/bin"
	cp -a "${_srcdir}/devo" "${_srcdir}/rg" "${_srcdir}/runtime" "${_srcdir}/tui" "${pkgdir}/opt/devo/"
	printf '#!/bin/sh\nexec /opt/devo/devo "$@"\n' > "${pkgdir}/usr/bin/devo"
	chmod 755 "${pkgdir}/usr/bin/devo"
	install -Dm644 "${_srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${_srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: Chaser <ch4ser@users.noreply.github.com>

pkgname=devo-bin
pkgver=0.1.31
pkgrel=1
pkgdesc="Open-source, provider-agnostic coding agent that lives in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/7df-lab/devo"
license=('MIT')
depends=('bash' 'ripgrep')
provides=('devo')
conflicts=('devo')
options=('!strip')

optdepends=(
	'git: inspect and work with Git repositories'
	'github-cli: interact with GitHub'
	'glab: interact with GitLab'
)

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/devo-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/devo-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('9ee0ecfae7f80fc9c4a7a705259d77b8a54a205d8cbf95b616411435116b1ac8')
sha256sums_aarch64=('422ae7d56ce1de351607a5a3db32f03f4521870666bcc110ae79eb85947ae2fc')

package() {
	local _target

	case "${CARCH}" in
		x86_64)
			_target="x86_64-unknown-linux-musl"
			;;
		aarch64)
			_target="aarch64-unknown-linux-musl"
			;;
		*)
			return 1
			;;
	esac

	local _srcdir="${srcdir}/devo-v${pkgver}-${_target}"

	install -Dm755 "${_srcdir}/devo" "${pkgdir}/usr/bin/devo"
	install -Dm644 "${_srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${_srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

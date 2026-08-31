# Maintainer: Chaser <ch4ser@users.noreply.github.com>

pkgname=devo-bin
pkgver=0.1.37
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

sha256sums_x86_64=('f64889835226a2b22a79bcb078bdcbffdcb21429492caad41f15dad147d6dc4d')
sha256sums_aarch64=('ab9fe53b2af90c3a077fa51abb53234515744a957b0478988a1c54d784f06361')

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

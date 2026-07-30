# Maintainer: Chaser <ch4ser@users.noreply.github.com>

pkgname=devo-bin
pkgver=0.1.32
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

sha256sums_x86_64=('a89a1823baece82a448726c7b45061c2a06a0c3f2c307206fc31eb0bf7e155f0')
sha256sums_aarch64=('4d368e943784ce9806d51fcd6aacd863cafc4768eb196a05e76ffec8e4a34969')

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

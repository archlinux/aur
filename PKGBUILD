# Maintainer: Sofian-Hedi Krazini <blackma9ick@proton.me>

# shellcheck shell=bash disable=2034,2154,2164

pkgname=udisken-bin
pkgver=0.1
pkgrel=2
pkgdesc='A small Linux automounter'
arch=(x86_64)
url="https://codeberg.org/blackma9ick/${pkgname%-bin}"
license=('GPL-3.0-or-later')
depends=(
	'sdbus-cpp>=2.1.0' 'sdbus-cpp<3.0.0' # SemVer
	'spdlog>=1.15.0'
	'udisks2>=2.10.0' 'udisks2<3.0.0' # X.0.0 (major) bumps
)
optdepends=(
	'xdg-utils: for opening drives in default file manager'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
install=service.install
source_x86_64=(
	"${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-x86_64.pkg.tar.zst"
	"${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-x86_64.pkg.tar.zst.sig"
)
b2sums_x86_64=(
	'89be53f4d16dcfb94569827be7bd1c0593516147fc1d0c984367ff8a4c0fd0b290ada203af6dbef88c9a0af3ec5b3726a206ad608afc16c3f81db9fdc498ea8f'
	'SKIP'
)
validpgpkeys=('F7DE7133F2CB6A18A0A9FCD8333CACEDE4C06716')

package() {
	install -Dm u=rwx,go=rx "usr/bin/${pkgname%-bin}" \
		"${pkgdir:?}/usr/bin/${pkgname%-bin}"
	install -Dm u=rw,go=r "usr/lib/systemd/user/${pkgname%-bin}.service" \
		"${pkgdir:?}/usr/lib/systemd/user/${pkgname%-bin}.service"
}

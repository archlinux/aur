# Maintainer: Glenn O. Larsen <glenn dot larsen at gmail dot com>
pkgname=warp-terminal-bin
pkgver=0.2024.02.20.08.01.stable.02
pkgrel=2
pkgdesc="Warp is a modern, Rust-based terminal with AI built in so teams can
 build great software, faster. Bringing collaboration to the command line,
 Warp lets teams save and share commands for streamlined onboarding and
 incident response."
arch=('x86_64')
url="https://www.warp.dev/"
license=('custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("https://releases.warp.dev/stable/v${pkgver:0:$((${#str} - 3))}_${pkgver:$((${#str} - 2))}/${pkgname%-bin}_${pkgver}_amd64.deb"
	"https://raw.githubusercontent.com/warpdotdev/Warp/main/LICENSE"
	"${pkgname%-bin}.sh")
sha256sums=('17409f293b601cea1e2627a7140a2a758295ff4653b02d4687339e405977a039'
	'1057b326e587edf2f81dc35c6c9cdd2e63d9af1c68e331d7ac8a4bc22ff9de49'
	'9ace6327e1eec7d1f3a84889857d61593835695321ce80e56fbdd4ed13247f1a')

package() {
	bsdtar xfv data.tar.xz -C "$pkgdir"

	desktop-file-edit --set-key=Exec --set-value="${pkgname%-bin} %U" \
		"$pkgdir/usr/share/applications/dev.warp.Warp.desktop"

	install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}

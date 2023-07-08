# Maintainer: foxbox <foxbox.aur@proton.me>
pkgname=fox-neat-wallpaper
pkgver=0.1.1
pkgrel=1
pkgdesc="A wallpaper based for archlinux and xfce4 that shows installed packages"
arch=('any')
url="https://github.com/jNullj/$pkgname"
license=('MIT')
depends=('imagemagick' 'xfconf' 'pacman-contrib' 'chromium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jNullj/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9baa2b039d07fa4c7ebddc3d46afa082384ed4b316489d210dfabb2e340e2d01')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "$pkgname.sh" "$pkgdir/opt/$pkgname/$pkgname.sh"
	install -Dm755 "render.html" "$pkgdir/opt/$pkgname/render.html"
	install -Dm755 "render.css" "$pkgdir/opt/$pkgname/render.css"
	install -Dm755 "render.js" "$pkgdir/opt/$pkgname/render.js"
	install -Dm755 "hook-script.sh" "$pkgdir/opt/$pkgname/hook-script.sh"
	install -Dm755 "logo.svg" "$pkgdir/opt/$pkgname/logo.svg"
	mkdir -p "$pkgdir/usr/bin/"
	ln -rTsF "$pkgdir/opt/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$pkgname.hook" "$pkgdir/etc/pacman.d/hooks/$pkgname.hook"
	install -Dm755 "$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
	install -Dm755 "$pkgname.timer" "$pkgdir/usr/lib/systemd/user/$pkgname.timer"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

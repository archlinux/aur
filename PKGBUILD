# Maintainer: foxbox <foxbox.aur@proton.me>
pkgname=fox-neat-wallpaper
pkgver=0.1.4
pkgrel=1
pkgdesc="A wallpaper based for archlinux and xfce4 that shows installed packages"
arch=('any')
url="https://github.com/jNullj/$pkgname"
license=('MIT')
depends=('imagemagick' 'xfconf' 'pacman-contrib' 'firefox')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jNullj/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('70634c2f7b7742b6187f8b43ac7d0b83f1f9a2ff096518a7dce7861acc83fd5d')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "$pkgname.sh" "$pkgdir/opt/$pkgname/$pkgname.sh"
	install -Dm644 "render.html" "$pkgdir/opt/$pkgname/render.html"
	install -Dm644 "render.css" "$pkgdir/opt/$pkgname/render.css"
	install -Dm644 "render.js" "$pkgdir/opt/$pkgname/render.js"
	install -Dm755 "hook-script.sh" "$pkgdir/opt/$pkgname/hook-script.sh"
	install -Dm644 "logo.svg" "$pkgdir/opt/$pkgname/logo.svg"
	mkdir -p "$pkgdir/usr/bin/"
	ln -rTsF "$pkgdir/opt/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$pkgname.hook" "$pkgdir/etc/pacman.d/hooks/$pkgname.hook"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
	install -Dm644 "$pkgname.timer" "$pkgdir/usr/lib/systemd/user/$pkgname.timer"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

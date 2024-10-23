# Maintainer: Mateusz Gałażyn <carbolymer@gmail.com
pkgname=kmonad-static
pkgver=0.4.3
pkgrel=1
pkgdesc="An advanced keyboard manager - static binary version"
arch=('x86_64')
url="https://github.com/kmonad/kmonad"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=("${pkgname%-static}")
conflicts=("${pkgname%-static}" "${pkgname%-static}-bin")
source=("https://github.com/kmonad/${pkgname%-static}/releases/download/$pkgver/${pkgname%-static}"
	"https://github.com/kmonad/${pkgname%-static}/archive/$pkgver.tar.gz")
md5sums=('3e88c9e203d8b576ebe09214954214ae'
         '5e9f54a9d63e0f736b6872d03981c3c8')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname%-static}" "$pkgdir/usr/bin/${pkgname%-static}"
	install -Dm644 "${pkgname%-static}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "${pkgname%-static}-$pkgver/doc/faq.md" "$pkgdir/usr/share/doc/$pkgname/faq.md"

	install -Dm644 "${pkgname%-static}-$pkgver/startup/${pkgname%-static}@.service" -t "$pkgdir/usr/lib/systemd/system"
	#install -Dm644 "${pkgname%-static}.service" -t "$pkgdir/usr/lib/systemd/system"

	install -Dm755 "${pkgname%-static}-$pkgver/keymap/tutorial.kbd" "$pkgdir/usr/share/doc/$pkgname/keymap/tutorial.kbd"

	for file in "${pkgname%-static}-$pkgver/keymap/template/"*.kbd; do
	  install -Dm755 "$file" -t "$pkgdir/usr/share/doc/$pkgname/keymap/template"
	done
}


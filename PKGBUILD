# Maintainer: Mateusz Gałażyn <carbolymer@gmail.com
pkgname=kmonad-static
pkgver=0.4.4
pkgrel=3
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
md5sums=('c7808524001cb7083be270ccc48ef7bc'
         '638608a766eceebcb3dfdedee62dd6af')

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


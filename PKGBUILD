# Maintainer: Simon Ding <me at simonding dot de>
pkgname=kmonad-contrib-autostart-git
pkgver=r24.c1a6b3a
pkgrel=1
pkgdesc="Additional KMonad config files"
arch=('any')
url="https://github.com/kmonad/kmonad-contrib"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+https://github.com/kmonad/kmonad-contrib")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd scripts/auto-run-on-every-keyboard
	install -Dm644 global-kmonad@.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 70-kmonad.rules -t "$pkgdir/etc/udev/rules.d/"
	install -Dm644 sd-kmonad -t "$pkgdir/etc/initcpio/install/"
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-notify-git
pkgver=1.8.2.r5.g9b4769c
pkgrel=1
pkgdesc="Notification manager for Neovim"
arch=('any')
url="https://github.com/rcarriga/nvim-notify"
license=('unknown')
groups=('neovim-plugin')
depends=('neovim')
optdepends=('neovim-telescope')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=notify.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

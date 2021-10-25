# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-pisces-git
pkgver=0.7.0.r0.ge45e086
pkgrel=2
pkgdesc="Fish plugin for matching paired symbols"
arch=('any')
url="https://github.com/laughedelic/pisces"
license=('LGPL3')
groups=('fish-plugins')
depends=('fish>=2.3')
makedepends=('git')
provides=('fish-pisces')
conflicts=('fish-pisces')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('5E1F1BC473EC7D07B782F5969E2DCD79D9E0A186')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	install -Dm 644 conf.d/pisces.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	find functions -type f -exec install -Dm 644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-autopair-git
pkgver=1.0.3.r0.g1222311
pkgrel=1
pkgdesc="Auto-complete matching pairs in the Fish command line"
arch=('any')
url="https://github.com/jorgebucaran/autopair.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'fish-pisces')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('CA88B7CBEDCEE375F2376C53E54BA3C0E646DB30')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  install -Dm 644 conf.d/autopair.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
  find functions -type f -exec install -Dm 644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

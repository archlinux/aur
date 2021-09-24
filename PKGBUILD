# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-fzf
pkgver=7.3
pkgrel=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.2.0' 'fzf>=0.27.2')
optdepends=(
	'fd>=7.5.0: faster, friendlier alternative to find'
	'bat>=0.16.0: smarter cat with syntax highlighting'
	'git')
makedepends=('git')
# checkdepends=('fish-fishtape')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('160735d107f2e6feaf9c51699abe425d36562bfb3a11135564c32944650b76c071fc7d5adc717a0d4f66df43c1ddad9a447d085a3063099dab7a6be1f9c395e7')

# check() {
#  cd "fzf.fish-$pkgver/"
#  find tests -type f -exec fish -Pc 'fishtape {}' \;
# }

package() {
	cd "fzf.fish-$pkgver/"
	install -Dm 644 completions/fzf_configure_bindings.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm 644 conf.d/fzf.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	find functions -type f -exec install -Dm 644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
	install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# Maintainer: Stick <stick@stma.is>

_gemname=rex-text
pkgname=ruby-$_gemname
pkgver=0.2.64
pkgrel=2
pkgdesc="This Gem contains all of the Ruby Exploitation(Rex) methods for text manipulation and generation"
arch=(any)
url="https://github.com/rapid7/rex-text"
license=('BSD')
depends=(ruby)
options=(!emptydirs)
source=(
	https://rubygems.org/downloads/$_gemname-$pkgver.gem
	https://raw.githubusercontent.com/rapid7/$_gemname/master/LICENSE
)
noextract=($_gemname-$pkgver.gem)
sha256sums=(
	'45815f8f3266106e1905889c5d932cb4d2d9607afec77b533a7ee3bc74b77939'
	'22a0624299df52a759730e5e3c56bee73812e1760b4cd4382c29346058df4297'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

# Maintainer: Stick <stick@stma.is>

_gemname=rex-struct2
pkgname=ruby-$_gemname
pkgver=0.1.3
pkgrel=2
pkgdesc="Ruby Exploitation(Rex) library for generating/manipulating C-Style structs"
arch=(any)
url="https://github.com/rapid7/rex-struct2"
license=('BSD')
depends=(
	ruby
)
options=(!emptydirs)
source=(
	https://rubygems.org/downloads/$_gemname-$pkgver.gem
	https://raw.githubusercontent.com/rapid7/$_gemname/master/LICENSE
)
noextract=($_gemname-$pkgver.gem)
sha256sums=(
	'9678a8e12afb5c9e8d8aaf1c3680ced7377f14af3ac2830a6d252559caf6e8c2'
	'22a0624299df52a759730e5e3c56bee73812e1760b4cd4382c29346058df4297'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

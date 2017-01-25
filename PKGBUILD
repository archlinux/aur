# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=between_meals
pkgname=ruby-${_gemname}
pkgver=0.0.7
pkgrel=1
pkgdesc="Library for calculating Chef differences between revisions"
arch=('any')
depends=('ruby' 'ruby-colorize' 'ruby-mixlib-shellout' 'ruby-json' 'ruby-rugged')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('Apache')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'e0928695f986c3c6d67f8a338f24d845210d4d784faac2cce526556a9a23598e'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

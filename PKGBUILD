# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=taste_tester
pkgname=ruby-${_gemname}
pkgver=0.0.12
pkgrel=1
pkgdesc="Utility for testing Chef changes using chef-zero"
arch=('any')
depends=('ruby' 'ruby-between_meals' 'ruby-colorize' 'ruby-mixlib-config')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('Apache')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'd0df730124c4218db615bada0930b5b47c34d5a85bba458df8a9efbe4180c723'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

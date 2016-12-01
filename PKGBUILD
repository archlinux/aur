# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=parser
pkgname=ruby-${_gemname}
pkgver=2.3.3.0
pkgrel=1
pkgdesc="A Ruby parser written in pure Ruby"
arch=('any')
depends=('ruby' 'ruby-ast')
url="https://rubygems.org/gems/${_gemname}"
noextract=("${pkgname#*-}-${pkgver}.gem")
license=('MIT')
source=(
	"https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem"
)
sha256sums=(
	'79c0d8a275fe67394920d085f92bf4cb4986ee1a95a891704dd1747d366cd899'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

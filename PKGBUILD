# Maintainer: farwayer <farwayer@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=parser
pkgname=ruby-${_gemname}
pkgver=2.4.0.0
pkgrel=1
pkgdesc="A Ruby parser written in pure Ruby"
arch=('any')
depends=(
  ruby
  'ruby-ast>=2.2' 'ruby-ast<3'
)
url="https://rubygems.org/gems/${_gemname}"
noextract=("${pkgname#*-}-${pkgver}.gem")
license=('MIT')
source=(
	"https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem"
)
sha256sums=('98a50996e8277c1215c4a193cdd3e0d44fd5810db14251b0774273a1d074198c')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

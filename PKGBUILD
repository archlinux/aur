# Maintainer: farwayer <farwayer@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=parser
pkgname=ruby-${_gemname}
pkgver=2.4.0.2
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
sha256sums=('63b2b30665b86d8e867bbb67069deca709443568394f1337d4947fd27b120c2f')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

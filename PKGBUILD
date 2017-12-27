# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=rubocop
pkgname=ruby-${_gemname}
pkgver=0.52.1
pkgrel=1
pkgdesc="Automatic Ruby code style checking tool."
arch=('any')
depends=(
  ruby
  'ruby-parallel>=1.10' 'ruby-parallel<2'
  'ruby-parser>=2.4.0.2' 'ruby-parser<3'
  'ruby-powerpack>=0.1' 'ruby-powerpack<1'
  'ruby-rainbow>=2.2.2' 'ruby-rainbow<4'
  'ruby-ruby-progressbar>=1.7' 'ruby-ruby-progressbar<2'
  'ruby-unicode-display_width>=1.0.1' 'ruby-unicode-display_width<2'
)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=('4ec659892e86c64ec25e7a543b4a717f9ee6e9450bdb9541e0d3492b43ce4234')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: farwayer <farwayer@gmail.com>

_gemname=rubocop
pkgname=ruby-${_gemname}
pkgver=0.49.1
pkgrel=2
pkgdesc="Automatic Ruby code style checking tool."
arch=('any')
depends=(
  ruby
# uncomment when ruby-parallel will be updated
#  'ruby-parallel>=1.10' 'ruby-parallel<2'
  'ruby-parser>=2.3.3.1' 'ruby-parser<3'
  'ruby-powerpack>=0.1' 'ruby-powerpack<1'
  'ruby-rainbow>=1.99.1' 'ruby-rainbow<3'
  'ruby-ruby-progressbar>=1.7' 'ruby-ruby-progressbar<2'
  'ruby-unicode-display_width>=1.0.1' 'ruby-unicode-display_width<2'
)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'bcb37220633a570611b68bf8d4649414624d90fad83a7bf8310940f61df51ed7'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=jekyll-feed
pkgname=ruby-${_gemname}
pkgver=0.9.1
pkgrel=1
pkgdesc="A Jekyll plugin to generate an Atom (RSS-like) feed of your Jekyll posts"
arch=('any')
depends=('ruby' 'ruby-jekyll')
makedepends=('ruby-bundler' 'ruby-nokogiri' 'ruby-rspec' 'ruby-typhoeus' 'ruby-rubocop')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'5e6d8cca482d3a09d7e00d6351dbbc4bdff0e602b0c43ac0b1736a19fc1346b6'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

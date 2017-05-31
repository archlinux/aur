# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=rubocop
pkgname=ruby-${_gemname}
pkgver=0.49.1
pkgrel=1
pkgdesc="Automatic Ruby code style checking tool."
arch=('any')
depends=('ruby' 'ruby-parser' 'ruby-powerpack' 'ruby-rainbow' 'ruby-ruby-progressbar' 'ruby-unicode-display_width')
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

# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=rubocop
pkgname=ruby-${_gemname}
pkgver=0.46.0
pkgrel=1
pkgdesc="Automatic Ruby code style checking tool."
arch=('any')
depends=('ruby' 'ruby-parser' 'ruby-powerpack' 'ruby-rainbow' 'ruby-progressbar' 'ruby-unicode-display_width')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'0c5087c157b6070319d06cab7594f9f72b5478344a2568b7029875a081c20418'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

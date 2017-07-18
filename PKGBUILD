# Maintainer: farwayer <farwayer@gmail.com>

_gemname=powerpack
pkgname=ruby-${_gemname}
pkgver=0.1.1
pkgrel=3
pkgdesc="A few useful extensions to core Ruby classes."
arch=('any')
depends=('ruby')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'83a81d0406f1628adc61b579689dc4509b30409a00fa4ca8f47ff212a91bd6ba'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

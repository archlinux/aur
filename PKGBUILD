# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=ruby-xz
pkgname=${_gemname}
pkgver=0.2.3
pkgrel=1
pkgdesc="These are simple Ruby bindings for the liblzma library"
arch=('any')
depends=('ruby' 'ruby-ffi' 'ruby-io-like')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'bcd9914521eb56de369ff1510599ff51c42a473891e44e377c280130f7be6f85'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

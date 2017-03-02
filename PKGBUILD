# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=io-like
pkgname=ruby-${_gemname}
pkgver=0.3.0
pkgrel=1
pkgdesc="IO::Like provided unbuffered read, write, and seek"
arch=('any')
depends=('ruby')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('Custom')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'd3fc128940d11704ac0d9bc0d46a2b30be162aca030273e690b1bfca8506d612'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

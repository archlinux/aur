# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=redcard
pkgname=ruby-${_gemname}
pkgver=1.1.0
pkgrel=1
pkgdesc="Ensure that the running Ruby implementation matches the desired language version, implementation, and implementation version"
arch=('any')
depends=('ruby')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('custom')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'60c73d440f29fc3577eec86de00d55ee5351647d2d450ea48bc6d2ae5a62b8fc'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=pleaserun
pkgname=ruby-${_gemname}
pkgver=0.0.28
pkgrel=1
pkgdesc="pleaserun"
arch=('any')
depends=(
	'ruby' 'ruby-cabin' 'ruby-clamp' 'ruby-dotenv' 'ruby-insist' 'ruby-mustache'
	'ruby-stud'
)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('Apache 2.0')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'36294017b019078eab9c1d9f37d36f254cd51435d718b1b431c0958d83d409b7'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

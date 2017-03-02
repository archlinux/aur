# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=stud
pkgname=ruby-${_gemname}
pkgver=0.0.22
pkgrel=1
pkgdesc="small reusable bits of code"
arch=('any')
depends=(
	'ruby' 'ruby-insist' 'ruby-rspec'
)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('Apache 2.0')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'275a8f6a5dc091e7a854f6298568b36416eeea3fb4615eaeea8bcc625fdf4ae5'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=jekyll-last-modified-at
pkgname=ruby-${_gemname}
pkgver=1.0.1
pkgrel=1
pkgdesc="A liquid tag for Jekyll to indicate the last time a file was modified."
arch=('any')
depends=('ruby' 'ruby-jekyll' 'ruby-posix-spawn')
makedepends=('ruby-rspec' 'ruby-redcarpet' 'ruby-spork')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
	'LICENSE'
)
sha256sums=(
	'54a2719588f5c40a38152199644f4f545b01119b1c5e3030e46b74a5b55da1c8'
	'eaa1755ff0203e4bbd36f46ed146ea4d1b2dc3348cd1cbd2ab0b2c4bf5fc502d'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

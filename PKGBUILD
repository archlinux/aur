# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=ruby-lint
pkgname=${_gemname}
pkgver=2.3.1
pkgrel=1
pkgdesc="A linter and static code analysis tool for Ruby."
arch=('any')
depends=('ruby' 'ruby-parser' 'ruby-slop')
#makedepends=('ruby-json' 'ruby-kramdown' 'ruby-redcard' 'ruby-simplecov' 'ruby-yard')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('custom')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'040ab20a862488cc1bd47cf5b6bf64192a88c9a42611f4921f80304ee29bf375'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

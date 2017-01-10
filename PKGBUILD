# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=jekyll-sitemap
pkgname=ruby-${_gemname}
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatically generate a sitemap.xml for your Jekyll site."
arch=('any')
depends=('ruby' 'ruby-jekyll')
makedepends=('ruby-bundler' 'ruby-rspec' 'ruby-rubocop' 'ruby-jekyll-last-modified-at')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'5a23b7a5f01e484028c9084ce3417357cacf6fe0f5b47726e1f27d9668ae8fc4'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	echo $LANG
}

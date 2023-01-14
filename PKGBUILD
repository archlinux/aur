# Maintainer: Bert Peters <bert@bertptrs.nl>

_gemname=jekyll-relative-links
pkgname=ruby-$_gemname
pkgver=0.7.0
pkgrel=1
pkgdesc="A Jekyll plugin to convert relative links to markdown files to their rendered equivalents."
arch=('any')
url="https://rubygems.org/gems/$_gemname"
license=("MIT")
depends=('jekyll')
makedepends=('ruby-rdoc')
source=(
	"https://rubygems.org/downloads/$_gemname-$pkgver.gem"
	"$pkgname-LICENSE.md::https://raw.githubusercontent.com/benbalter/$_gemname/v$pkgver/LICENSE.md"
)
noextract=("$_gemname-$pkgver.gem")
options=('!emptydirs')
sha256sums=('831e54c348eeae751845c0d4ac4b244bd73b664341f0e8c9f1803b16f4570835'
            'abb5c27df270e4bb12ce4570dd6c84e8ec64318184da1cac01ddfd47ce443bb9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir"/usr/bin $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir"/cache/$_gemname-$pkgver.gem
  install -Dm0644 $pkgname-LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

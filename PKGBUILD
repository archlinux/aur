# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=rubocop
pkgname=ruby-${_gemname}
pkgver=0.79.0
pkgrel=1
pkgdesc="Automatic Ruby code style checking tool."
arch=('any')
depends=(
  ruby
  ruby-jaro_winkler
  ruby-parallel
  ruby-parser
  ruby-powerpack
  ruby-rainbow
  ruby-ruby-progressbar
  ruby-unicode-display_width
)
makedepends=(rubygems ruby-rdoc)
url="https://rubocop.readthedocs.io"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('325b331102897bd19d08f4e4d18dde806f24cbf5768110663ae16fab1f17a792')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

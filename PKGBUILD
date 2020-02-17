# Maintainer: Mikhail f. Shiryaev <mr point felixoid a gmail dot com>

_gemname=rubocop-rspec
pkgname=ruby-${_gemname}
pkgver=1.38.1
pkgrel=1
pkgdesc="Code style checking for RSpec files"
arch=('any')
depends=(
  ruby
  ruby-rubocop
)
makedepends=(rubygems ruby-rdoc)
url="https://rubocop.readthedocs.io"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('b15e88e3d7e941ede3361629c6da664a912db594d9e63f1e7d43510d7be7b5fb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

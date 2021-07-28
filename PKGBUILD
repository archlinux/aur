# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=formatador
pkgname=ruby-${_gemname}
pkgver=0.3.0
pkgrel=1
pkgdesc="STDOUT text formatting"
arch=(any)
depends=(ruby)
# checkdepends=(ruby-rake ruby-shindo)
makedepends=(rubygems ruby-rdoc)
url=https://github.com/geemus/formatador
license=(MIT)
options=(!emptydirs)
source=(https://github.com/geemus/formatador/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('SKIP')

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

# check() {
#   cd $_gemname-$pkgver
#   # we can't actually run these because there's a circular dependency with
#   # ruby-shindo
#   # rake
# }

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 changelog.txt "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}

# vim: set ts=2 sw=2 et:

# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=ice_nine
pkgname=ruby-${_gemname}
pkgver=0.11.2
pkgrel=1
pkgdesc="Deep Freeze Ruby Objects"
arch=(any)
depends=(ruby)
makedepends=(git rubygems ruby-rdoc)
url=https://github.com/dkubb/ice_nine
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/dkubb/ice_nine.git?tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

package() {
  cd $_gemname
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:

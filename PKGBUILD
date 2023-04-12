# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=shoulda
pkgname=ruby-$_gemname
pkgver=5.0.0.rc1
pkgrel=1
pkgdesc="Makes tests easy on the fingers and the eyes"
arch=(any)
url=https://github.com/thoughtbot/shoulda
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-shoulda-context ruby-shoulda-matchers)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('af81713778f40e3a3ef7b07a3c29515bfdf7c98f3e068e8491a3b62000a90d9e')

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:

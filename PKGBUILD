# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=test-queue
pkgname=ruby-${_gemname}
pkgver=0.5.0
pkgrel=1
pkgdesc="parallel test runner for CI environments"
arch=(any)
depends=(ruby)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc git)
url=https://github.com/tmm1/test-queue
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/tmm1/${_gemname}.git#tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  rspec spec
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

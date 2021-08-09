# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=guard-rspec
pkgname=ruby-${_gemname}
pkgver=4.7.3
pkgrel=1
pkgdesc="Guard::RSpec automatically run your specs"
arch=(any)
depends=(ruby ruby-guard ruby-rspec ruby-guard-compat)
makedepends=(git rubygems ruby-rdoc)
url=https://github.com/guard/guard-rspec
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/guard/guard-rspec.git?tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd $_gemname
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:

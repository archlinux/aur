# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=set
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc="This library provides the Set class"
arch=(any)
url=https://github.com/ruby/set
license=(BSD)
depends=(ruby)
checkdepends=(ruby-rake ruby-bundler ruby-test-unit)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/ruby/set.git?tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  rake test
}

package() {
  cd $_gemname
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

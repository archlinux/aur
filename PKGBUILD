# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=buftok
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=1
pkgdesc="extract token delimited entities from a sequence of arbitrary inputs"
arch=(any)
url=https://github.com/sferik/buftok
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-test-unit)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/sferik/buftok/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('dd47be7642f5260b83ad2c2dcb88bb747a0be9888500aecc0a60d89bb62dcebb')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake test
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:

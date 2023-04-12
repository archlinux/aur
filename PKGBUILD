# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: asm0dey <pavel.finkelshtein@gmail.com>

_gemname=tty-color
pkgname=ruby-$_gemname
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal color capabilities detection"
arch=(any)
url=https://github.com/piotrmurach/tty-color
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('28390c10cf2e2ebe7a0ea360ef3f3eea833d455ca0afdc880a8d7a258dd728df')

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake
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

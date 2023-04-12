# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farawayer <farwayer@gmail.com>

_gemname=tty-cursor
pkgname=ruby-$_gemname
pkgver=0.7.1
pkgrel=1
pkgdesc="Terminal cursor movement and manipulation"
arch=(any)
url=https://github.com/piotrmurach/tty-cursor
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('d957a1151af0d747607b359be00d526f10e2831f94c2eaf2548778ab2bdcc3e3')

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake spec
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

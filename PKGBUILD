# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Tom Vincent <aur@tlvince.com>

_gemname=tty-pager
pkgname=ruby-$_gemname
pkgver=0.14.0
pkgrel=1
pkgdesc="A cross-platform terminal pager"
arch=(any)
url=https://github.com/piotrmurach/tty-pager
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-tty-screen ruby-strings)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('9b1035b79c05a2cb13f73fbc148946cd7a87f04b0311a20355f89e3c14d1570d')

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

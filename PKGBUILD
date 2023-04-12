# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Tom Vincent <aur@tlvince.com>

_gemname=tty-which
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=1
pkgdesc="Cross-platform implementation of Unix 'which' command"
arch=(any)
url=https://github.com/piotrmurach/tty-which
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('e7116a505846f42ee25b8f755260b227f4e8b09a628c3ca8e5cabb05459adf14')

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

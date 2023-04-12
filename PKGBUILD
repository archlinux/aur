# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farawayer <farwayer@gmail.com>

_gemname=tty-screen
pkgname=ruby-$_gemname
pkgver=0.8.1
pkgrel=2
pkgdesc="Terminal screen detection"
arch=(any)
url=https://github.com/piotrmurach/tty-screen
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('8b2c80a410d79c597880e9e981b006d2543ae9fd1338b183054392fe42ae06ae')

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

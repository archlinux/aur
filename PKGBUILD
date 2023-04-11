# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=webrobots
pkgname=ruby-$_gemname
pkgver=0.1.2
pkgrel=2
pkgdesc="A Ruby library to help write robots.txt compliant web robots"
arch=(any)
url=https://github.com/knu/webrobots
license=(BSD)
options=(!emptydirs)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('08a5d80307c7654d90294ed4a9742506cc6638ef467afe93fcd1906b49228c69')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec
}

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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
}

# vim: set ts=2 sw=2 et:

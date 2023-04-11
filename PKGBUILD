# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=shoulda-matchers
pkgname=ruby-$_gemname
pkgver=5.3.0
pkgrel=1
pkgdesc="Shoulda Matchers provides RSpec- and Minitest-compatible one-liners"
arch=(any)
url=https://github.com/thoughtbot/shoulda-matchers
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('38e12a2862018744839ef78a274e8672a634af24a5c01844a13ab01086193717')

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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:

# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=concord
pkgname=ruby-$_gemname
pkgver=0.1.6
pkgrel=1
pkgdesc="Helper for object composition"
arch=(any)
url=https://github.com/mbj/concord
license=(MIT)
depends=(ruby ruby-adamantium ruby-equalizer)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('755c0f4ff9b5e7895e7d06d50f50f235722ebc2f5a226bd21fa77204e17e5db8')

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rspec
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

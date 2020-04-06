# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer at gmail dot com>

_gemname=powerpack
pkgname=ruby-${_gemname}
pkgver=0.1.2
pkgrel=1
pkgdesc="A few useful extensions to core Ruby classes."
arch=(any)
depends=(ruby)
makedepends=(ruby-rdoc rubygems)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('dbc3c2ecb85ae830554135d1447171a8f24d901fa41beadacdc790c68f69a1e4')
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

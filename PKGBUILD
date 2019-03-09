# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>

_gemname=parallel
pkgname=ruby-$_gemname
pkgver=1.14.0
pkgrel=1
pkgdesc="Run any kind of code in parallel processes"
arch=(any)
url="https://github.com/grosser/parallel"
license=(MIT)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('fbb9c2ed770cb2bbfe9dc3486b0bb97fde95fa415b3472d721072b41393e0d96')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

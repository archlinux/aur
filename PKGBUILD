# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=backports
pkgname=ruby-$_gemname
pkgver=3.17.2
pkgrel=1
pkgdesc='Essential backports that enable many of the nice features of Ruby 1.8.7 up to 2.1.0 for earlier versions.'
arch=(any)
url='http://github.com/marcandre/backports'
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e860e4c1784b49e81294ce0bdd27226e28bbec9163398d79206c8dced3324c7625bf75c5ccf09bbcee4cf7bfa96371f37572e6d2d8a22dd2204a441eccd716fb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

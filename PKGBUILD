# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=backports
pkgname=ruby-$_gemname
pkgver=3.15.0
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
sha512sums=('c6f5f99161111044009f72b08308abf955ddccf6fa35815b4c2dda71ee5d8db98218845a24924d48562917c9f9e93d87ff55fb99f62b912f9ad8790d641f3066')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

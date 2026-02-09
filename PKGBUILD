# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=backports
pkgname=ruby-$_gemname
pkgver=3.25.3
pkgrel=1
pkgdesc='Essential backports that enable many of the nice features of Ruby for earlier versions.'
arch=(any)
url='http://github.com/marcandre/backports'
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('a9d929d945032387064e43fa0a3bda55d345ae1ad9fbceb8819ae2d413b29054e22cc5be80c65335a6f14f13dbbe8ddfd0ea1636634c5555bd5b9054e34afd23')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

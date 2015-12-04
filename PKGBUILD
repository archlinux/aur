# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=nori
pkgname=ruby-$_gemname
pkgver=2.6.0
pkgrel=1
pkgdesc='XML to Hash translator'
arch=(any)
url='https://github.com/savonrb/nori'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('bec947e4c05437d373cf13fe04368d9caf54bd3c97d152a042ae348a81df4698ed769fa75f0fc14ca3f86f4f8da8ea5ce3d1f7cf43a1e64b8d58f7ca39ef5b45')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

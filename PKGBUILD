# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-google
pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc='This library can be used as a module for fog or as standalone provider to use the Google in applications.'
arch=(any)
url='https://github.com/fog/fog-google'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('d7a74a11743532998620120a35235bc3a548f2f141262e48fc78b97ca842c7d2d4333970da416d8e28d92350aff4343fbaad831854c5c5436c9f170e00634c41')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

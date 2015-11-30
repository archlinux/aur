# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-dynect
pkgname=ruby-$_gemname
pkgver=0.0.2
pkgrel=1
pkgdesc='This library can be used as a module for `fog` or as standalone provider to use Dynect DNS in applications.'
arch=(any)
url='http://github.com/fog/fog-dynect'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('3f38c4b7cb2ee742c32ec1c21d2c79321a91aa48341afb1b2718173ca9707ae35db64a225c42b6fffa89ca70bf632d06ed41d41a50a94625bd1557b8987d3808')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

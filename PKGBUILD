# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-dynect
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=1
pkgdesc='This library can be used as a module for `fog` or as standalone provider to use Dynect DNS in applications.'
arch=(any)
url='http://github.com/fog/fog-dynect'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e7eed3231c77329d46c607a64205066ce24dc3cdc41f709c18adc891e960ab057bae8ca65d986829a83cf43c8c08b6c0ea4e3fbd1a4d45cb54fe6c998d6fa720')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

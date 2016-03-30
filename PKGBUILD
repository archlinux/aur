# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=eventmachine
pkgname=ruby-$_gemname
pkgver=1.2.0.1
pkgrel=2
pkgdesc='Ruby/EventMachine library'
arch=('i686' 'x86_64')
url='http://rubyeventmachine.com'
license=(Ruby GPL)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('a861a2c5172b7cf2720bdb54f52ea96c311c10efdb2f54970054901674e044a72307a5b32210efbbdb78d0472a9b3fb6e898640e1c0b406bdad8b581970e30aa')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

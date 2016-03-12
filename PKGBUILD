# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=eventmachine
pkgname=ruby-$_gemname
pkgver=1.0.9.1
pkgrel=1
pkgdesc='Ruby/EventMachine library'
arch=(any)
url='http://rubyeventmachine.com'
license=(Ruby GPL)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('5cbc178c604fe9a21850c298f7a5b6f904573f5e1db9e07fee599c5700841c52ec0311a6e50192eff9c1bb45cf30a9dd81d2150fe9d04cabd24cc7c9c32c5df0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

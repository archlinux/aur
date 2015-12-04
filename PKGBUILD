# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=eventmachine
pkgname=ruby-$_gemname
pkgver=1.0.8
pkgrel=1
pkgdesc='Ruby/EventMachine library'
arch=(any)
url='http://rubyeventmachine.com'
license=(Ruby GPL)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('55bfb8a22149495ca70913e6df6b9861cf0e10a512cdd25579064a816eb7e365bd0a03a1219ed23ed99772b9b312e3ce137781cb0890e31fbb5e5f542ba5ef70')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

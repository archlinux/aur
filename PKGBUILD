# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=backports
pkgname=ruby-$_gemname
pkgver=3.6.7
pkgrel=1
pkgdesc='Essential backports that enable many of the nice features of Ruby 1.8.7 up to 2.1.0 for earlier versions.'
arch=(any)
url='http://github.com/marcandre/backports'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('fd74fb8a139f8371ac9a7a9f067764b99fdb91e1c1d2eabcb187afb804cec7e0b2b0df931aefc8de114e5b51a4974e619afb5cca9403f2c04049f5c281415e56')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

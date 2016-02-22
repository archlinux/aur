# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=yajl-ruby
pkgname=ruby-$_gemname
pkgver=1.2.1
pkgrel=2
pkgdesc='Ruby C bindings to the excellent Yajl JSON stream-based parser library.'
arch=('any')
url='http://github.com/brianmario/yajl-ruby'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('32722b7c8a8408752716654f91b50aad98fd24ef72438d69531553ece4f63ffd3f78d7745a9e053e297f2c4a96af7638eea6271893b586a6a01482f71ab27fe6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}

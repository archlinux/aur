# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=rouge
pkgname=ruby-$_gemname
pkgver=1.10.1
pkgrel=1
pkgdesc='Rouge aims to a be a simple, easy-to-extend drop-in replacement for pygments.'
arch=(any)
url='http://rouge.jneen.net/'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('eb5215c5e1f45feb6f76f24f0a19be2c75f1ec861164ac051f3ea77dd5eda6b9b064806c14d0bfe291bff6a9ed724977ea40933ee1409928195ac96370d7c964')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-google
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc='This library can be used as a module for fog or as standalone provider to use the Google in applications.'
arch=(any)
url='https://github.com/fog/fog-google'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('44ec3a5476aa5ae87367edb2d9ff23316210ec88ec64ddb559ae33045774ae90032cb573c2f7a04250aea6434bfe1a7f1a2b1d7732e42ccfabd079e2dd598135')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

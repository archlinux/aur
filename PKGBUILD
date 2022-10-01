# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-profitbricks
pkgname=ruby-$_gemname
pkgver=4.1.1
pkgrel=1
pkgdesc='This library can be used as a module for fog or as standalone ProfitBricks provider.'
arch=(any)
url='https://github.com/fog/fog-profitbricks'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('c79caff85a3c690351ba0ea60d73760f85fef4a434e2db75fc4851ca34d02292691b826df4e4dd123aa5b079b891952e2ac0bd620fd16eae5292a1d48c132f50')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

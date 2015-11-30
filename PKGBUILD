# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-profitbricks
pkgname=ruby-$_gemname
pkgver=0.0.5
pkgrel=1
pkgdesc='This library can be used as a module for fog or as standalone ProfitBricks provider.'
arch=(any)
url='https://github.com/fog/fog-profitbricks'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-xml ruby-nokogiri)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e2d2858f1e7afbf3df114238d0c7107e7f9a2a0670611c253452347fe8ce849d13aa775f3ab16acbaf4629fd656f7c389d53857c129ebd8260d384161403f9d1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

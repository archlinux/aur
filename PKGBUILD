# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=toml
pkgname=ruby-$_gemname
pkgver=0.1.2
pkgrel=1
pkgdesc='Parse your TOML.'
arch=('any')
url='http://github.com/jm/toml'
license=('MIT')
depends=('ruby' 'ruby-parslet-1.5')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('1b3c902f7a9d6c873185a7274021fc4a687c9a60ec40078b563421026a7161137bb5f0adf138664d1993b097203c62ecccec4d538e84379fd64d0acf1e29f31d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=pygments.rb
pkgname=ruby-$_gemname
pkgver=1.2.1
pkgrel=1
pkgdesc='pygments wrapper for ruby'
arch=(any)
url='https://github.com/tmm1/pygments.rb'
license=('MIT')
depends=('ruby' 'python2' 'ruby-multi_json>=1.0.0')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('f0fc63ec028169872e28e2181c6a10c8a3f5e7f07074ba9f43475a0b5aa403a03d7045abb03433b600ef3d74c460556355b4ee64be598d3b93ddb1e0bb306259')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

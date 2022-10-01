# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-xenserver
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='Module for the fog gem to support XENSERVER.'
arch=(any)
url='https://github.com/fog/fog-xenserver'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-xml ruby-xmlrpc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('addaa8168047ab2b5fb1bbfbc93ef5c49dea48fd436a0df5301c1d5c5dbe04f1817d6716f4d220995b11bb761fc3f682d8d5b3fff0cc308fec344ae505445977')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

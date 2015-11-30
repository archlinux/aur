# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de

_gemname=childprocess
pkgname=ruby-$_gemname
pkgver=0.5.8
pkgrel=1
pkgdesc='This gem aims at being a simple and reliable solution for controlling external programs running in the background on any Ruby / OS combination.'
arch=(any)
url='http://github.com/jarib/childprocess'
license=(MIT)
depends=(ruby ruby-ffi)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e2871861f727945ee3635364152acbb4229f5b896039f28a9735f5c42230180e4142e7ee1473cd43724483cd63c93d58502e48c9f6554e1b3036dc3f82141a56')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

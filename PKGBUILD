# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de

_gemname=childprocess
pkgname=ruby-$_gemname
pkgver=0.8.0
pkgrel=1
pkgdesc='This gem aims at being a simple and reliable solution for controlling external programs running in the background on any Ruby / OS combination.'
arch=(any)
url='http://github.com/jarib/childprocess'
license=(MIT)
depends=('ruby' 'ruby-ffi')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('7e10c15930012bf99ea28afa677a6f745d4e6ebfc21f21f7101111c5a2d35df4fb146bbddb4d1e7a6711324ee7604af50995960570e85ed3f8fe087c59fc02cf')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-document --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

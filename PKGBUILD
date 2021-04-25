# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=strptime
pkgname=ruby-$_gemname
pkgver=0.2.5
pkgrel=2
pkgdesc='a fast strptime/strftime engine'
arch=(x86_64)
url='https://github.com/nurse/strptime'
license=(BSD)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('827baf3e21d1c3f40e102d2e1ab1be769434e0fe6421be86abfdf1ef42a9dc05740d181778cd056c2250cb2ae4204f7c7f255761eff859d52235adb2b3912a7a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


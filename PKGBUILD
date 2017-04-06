# Maintainer: Husam Bilal <husam212@gmail.com>

_gemname=rake-compiler-dock
pkgname=ruby-$_gemname
pkgver=0.6.0
pkgrel=1
pkgdesc='Cross compiler environment for building Windows binary gems.'
arch=(any)
url='https://github.com/rake-compiler/rake-compiler-dock'
license=(MIT)
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b112e1f097b7f45922991490bb49cbd89ad071a0a28b4cf90af5b3f56c8aab8b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}


# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=uglifier
pkgname=ruby-$_gemname-3
pkgver=3.2.0
pkgrel=1
pkgdesc='Ruby wrapper for UglifyJS JavaScript compressor'
arch=(any)
url='http://github.com/lautis/uglifier'
license=(MIT)
depends=(ruby ruby-execjs)
makedepends=('ruby-rdoc')
provides=("ruby-$_gemname=$pkgver")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0380f5f30a696863a4b75d5ad9944289c64565df')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

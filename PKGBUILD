# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=rake
pkgname=ruby27-$_gemname
pkgver=13.0.3
pkgrel=2
pkgdesc='Make-like build tool implemented in Ruby'
provides=(rake)
arch=(any)
url='https://ruby.github.io/rake/'
license=(MIT)
depends=(ruby2.7)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('cecfc63e8cf52f016d001d7ea886be434c4713c8d0af1d5c99b685c0524577239e7199376aed0b2f167e4f67bca1e2572c422b35aecb3aa6af4d9e8d6e2d347d')

package() {
  local _gemdir="$(ruby-2.7 -e'puts Gem.default_dir')"
  gem-2.7 install --ignore-dependencies --no-user-install --no-document --install-dir "$pkgdir/$_gemdir" --bindir "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/MIT-LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv "${pkgdir}/usr/bin/rake" "${pkgdir}/usr/bin/ruby27-rake"
}

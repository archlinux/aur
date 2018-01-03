#$Id$
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: <stefanh-husmann@t-online.de>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname=hpricot
pkgname=ruby-$_gemname
pkgver=0.8.6
pkgrel=6
pkgdesc='A swift, liberal HTML parser with a fantastic library'
arch=(x86_64)
url='http://code.whytheluckystiff.net/hpricot/'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('87ce2c17960a5e1d7ceaa16d0591ca6a28379ce0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/test"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
}

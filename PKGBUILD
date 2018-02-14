_gemname=hashie
pkgname=ruby-$_gemname
pkgver=3.5.7
pkgrel=1
pkgdesc='A collection of classes and mixins that make hashes more powerful.'
arch=(x86_64)
url='https://github.com/intridea/hashie'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c6830cab573612f811a80ba6b05c5f993cbfe260')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  #rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
}

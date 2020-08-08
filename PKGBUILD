# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=kramdown
pkgname=ruby-$_gemname-2_1
pkgver=2.1.0
pkgrel=1
pkgdesc='kramdown is a fast, pure-Ruby Markdown-superset converter.'
arch=(any)
url='http://kramdown.gettalong.org'
license=(MIT)
depends=(ruby)
makedepends=('ruby-rdoc')
provides=("ruby-$_gemname=$pkgver")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('caa3e24ec1ea7d42f3bb17de84971d798da71f96')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  # non-HEAD version should not install any files in /usr/bin
  rm -r "$pkgdir/usr/bin/"
}

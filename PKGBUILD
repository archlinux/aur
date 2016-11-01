#$Id$
# Maintainer: Greg Sutcliffe <aur@emeraldreverie.org>

_gemname=apipie-bindings
pkgname=ruby-$_gemname
pkgver=0.0.18
pkgrel=2
pkgdesc='Bindings for API calls that are documented with Apipie. Bindings are generated on the fly.'
arch=(any)
url='http://github.com/Apipie/apipie-bindings'
license=(MIT)
depends=(ruby ruby-json ruby-oauth ruby-rest-client)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c87bd6c433cb350f38a2ca5768043acad25a6dba')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/test"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

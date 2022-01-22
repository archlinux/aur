# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=fog-local
pkgname=ruby-$_gemname
pkgver=0.8.0
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support local filesystem storage.'
arch=(any)
url='https://github.com/fog/fog-local'
license=(MIT)
depends=(ruby-fog-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('263b2d09e54c69d1b87ad7f235a1a1e53c8a674edcedf7512c1715765ad7ef79')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

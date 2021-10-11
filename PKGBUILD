# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=fog-local
pkgname=ruby-$_gemname
pkgver=0.7.0
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support local filesystem storage.'
arch=(any)
url='https://github.com/fog/fog-local'
license=(MIT)
depends=(ruby ruby-fog-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('0ecec6ffcdd1ff9d51d3427b9f3416729d075da9d48a4399ccb35ef53bd8c6a1a6f60e1d6f200d8805008fcfd708e326edc3efeec634707a9e78d46ed525d5cc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

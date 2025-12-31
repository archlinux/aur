# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ruby-ruby_wasm
_gemname=${pkgname#ruby-}
pkgver=2.8.1
pkgrel=1
pkgdesc="Ruby to WebAssembly toolkit."
arch=("x86_64")
depends=(
  'gcc-libs'
  'glibc'
  'ruby'
  'ruby-logger'
)
makedepends=(cargo clang rubygems)
url="https://rubygems.org/gems/ruby_wasm"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('00b53cf88b719bd83e7adde029e192d2d3b52befff322e95d24e2a0cbf0e7775')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

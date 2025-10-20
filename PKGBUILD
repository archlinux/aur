# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ruby-ruby_wasm
_gemname=${pkgname#ruby-}
pkgver=2.7.2
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
sha256sums=('6e197a3d48c83240fc741027d9a38ced8637604d2b77372b5ae587f742a1420d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

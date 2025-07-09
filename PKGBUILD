# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ruby-ruby_wasm
_gemname=${pkgname#ruby-}
pkgver=2.7.1
pkgrel=1
pkgdesc="Ruby to WebAssembly toolkit."
arch=("x86_64")
depends=(
  'gcc-libs'
  'glibc'
  'ruby'
)
makedepends=(cargo clang rubygems)
url="https://rubygems.org/gems/ruby_wasm"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('b3c9c6cfab73c3c47924cde88c552487fb2ff15d69f9dff3a812372ea4af1c33')

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

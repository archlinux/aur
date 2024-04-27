# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

pkgname=ruby-parlour
_gemname=${pkgname#ruby-}
pkgver=8.1.0
pkgrel=1
pkgdesc="A type information generator, merger and parser for Sorbet and Ruby 3/Steep"
arch=("any")
depends=(
  'ruby'
  'ruby-commander>=4.5'
  'ruby-parser'
  'ruby-rainbow>=3.0'
  'ruby-sorbet-runtime>=0.5'
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('7081c8d9e8ff0c77289877560690015415399fc216e05c7e48736b15184ef459')

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

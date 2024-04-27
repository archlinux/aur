# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

pkgname=ruby-sorbet-runtime
_gemname=${pkgname#ruby-}
pkgver=0.5.11358
pkgrel=1
pkgdesc="Sorbet's runtime type checking component"
arch=("any")
depends=(
  'ruby>=2.7.0'
  'ruby-concurrent-ruby>1.1.5'
  'ruby-minitest>5.11'
  'ruby-pry'
  'ruby-pry-byebug'
  'ruby-rake'
  'ruby-rubocop'
  'ruby-rubocop-performance'
  'ruby-subprocess>1.5.3'
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('41e46030d77145dfafb7097caa070270779314177d02615d59afe3bd5c10e2bc')

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

# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

pkgname=ruby-language_server-protocol
_gemname=${pkgname#ruby-}
pkgver=3.17.0.3
pkgrel=1
pkgdesc="A Language Server Protocol SDK"
arch=("any")
depends=(
  'ruby>=2.5.0'
  'ruby-activesupport'
  'ruby-bundler>=2.0.0'
  'ruby-m'
  'ruby-minitest>=5.0'
  'ruby-minitest-power_assert'
  'ruby-rake>=12.3.3'
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('3d5c58c02f44a20d972957a9febe386d7e7468ab3900ce6bd2b563dd910c6b3f')

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

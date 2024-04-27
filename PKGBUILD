# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

pkgname=ruby-subprocess
_gemname=${pkgname#ruby-}
pkgver=1.5.6
pkgrel=1
pkgdesc="Control and communicate with spawned processes"
arch=("any")
depends=(
  'ruby>=2.7.0'
  'ruby-minitest>=5.0'
  'ruby-pry'
  'ruby-rake'
  'ruby-sord'
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('420bc80395fd7695852b1f3d13188c5bbc63061d0a512dc8c3e5acd41d54896c')

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

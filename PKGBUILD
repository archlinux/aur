# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

pkgname=ruby-lsp
_gemname=${pkgname}
pkgver=0.18.0
pkgrel=1
pkgdesc="An opinionated language server for Ruby"
arch=("any")
depends=(
  ruby
  ruby-language_server-protocol
  ruby-prism
  ruby-rbs
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('5b6104c78aca6bf562f43a8b553ee45618a1580e0d43ce5f5d3a4964c2062dbe')

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

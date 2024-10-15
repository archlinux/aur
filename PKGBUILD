# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

pkgname=ruby-lsp
_gemname=${pkgname}
pkgver=0.17.2
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
sha256sums=('e1878804352ad98dcccbc2fe7786da78707950663614238e8f6b537ea9333616')

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

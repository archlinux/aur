# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

pkgname=ruby-tomlrb
pkgver=1.3.0
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="A racc based toml parser"
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("MIT")
depends=('ruby')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('68666bf53fa70ba686a48a7435ce7e086f5227c58c4c993bd9792f4760f2a503')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

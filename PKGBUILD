# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

pkgname=ruby-tomlrb
pkgver=1.2.9
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="A racc based toml parser"
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("MIT")
depends=('ruby')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('efe5bd8e86c5cf091c5801e3ed3727456c01525963f07a35aa9348cd0af6535a')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

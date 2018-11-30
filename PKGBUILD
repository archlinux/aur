# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
pkgname=ruby-json_schema
pkgver=0.19.1
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="A JSON Schema V4 and Hyperschema V4 parser and validator."
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("MIT")
depends=('ruby')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('5e5bb8d8c171a08be394e894c22e662fbe4127657e7bb9f7230a604b88c0965f')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies --no-ri \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

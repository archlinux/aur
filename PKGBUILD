# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
pkgname=ruby-net-ldap
pkgver=0.16.1
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="Pure Ruby LDAP library"
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("GPL")
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('f0492138e45da35f961d329ee27c9d5aac8a7d866b95fb31671fa9803e7ed104')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

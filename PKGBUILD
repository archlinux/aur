# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
pkgname=ruby-net-ldap
pkgver=0.17.0
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="Pure Ruby LDAP library"
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("GPL")
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('d62474b28b9f18d9108a7c859171bb1b9ebf0e1bc1d218e79170c0f373f729c8')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

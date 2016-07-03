# Maintainer:  Achilleas Pipinellis <axilleas at archlinux.info>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
# Contributor: gem2arch 0.1
pkgname=ruby-net-ssh
pkgver=3.2.0
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="A pure-Ruby implementation of the SSH2 client protocol."
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("GPL")
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
md5sums=('3967b10cb9c83cbb7771fefe62cfb25f')

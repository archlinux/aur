# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor:  Achilleas Pipinellis <axilleas at archlinux.info>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
# Contributor: gem2arch 0.1

_gemname=net-ssh
_pkgname=ruby-${_gemname}
pkgname=${_pkgname}-2.9.2
pkgver=2.9.2
pkgrel=1
pkgdesc="A pure-Ruby implementation of the SSH2 client protocol, version 2.9.2"
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("GPL")
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('19c11b66feb5659b8e4a394f972ef1e9bb5fcac23754da2da485d7fc03910bdc')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

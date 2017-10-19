# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
pkgname=ruby-ref
pkgver=2.0.0
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="Library that implements weak, soft, and strong references in Ruby that work across multiple runtimes"
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("MIT")
depends=('ruby')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('31cafc3ba73128e3c32791c9c8ddc2ee54d1cb3eac8161f73d9ecea809bee412')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

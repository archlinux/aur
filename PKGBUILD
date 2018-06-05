# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
pkgname=ruby-tomlrb
pkgver=1.2.6
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="A racc based toml parser"
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("MIT")
depends=('ruby')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('ffb175c4d5011a9128b94db13493e3243e81ce951a2472063bf9068df631f025')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
pkgname=ruby-ddmemoize
pkgver=1.0.0
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="Adds support for memoizing functions"
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("MIT")
depends=('ruby' 'ruby-ddmetrics' 'ruby-ref')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('d42cc6aa4800c6e3282918d423accb50470d603280b1cf41a6bf8c061d84d497')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install \
    --no-user-install --ignore-dependencies \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

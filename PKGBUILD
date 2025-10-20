# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ruby-gdbm
_gemname=${pkgname#ruby-}
pkgver=2.1.1
pkgrel=1
pkgdesc="Ruby extension for GNU dbm."
arch=("x86_64")
depends=(
  'gdbm'
  'glibc'
  'ruby>=2.3.0'
)
makedepends=(rubygems)
url="https://rubygems.org/gems/gdbm"
noextract=($_gemname-$pkgver.gem)
license=("BSD-2-Clause")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('b14a4c7b0d0abbac9a021dc0e85cc9ba90efb2680edd4f80cc35c8752c880fac')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

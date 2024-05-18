# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=ovirt-engine-sdk
pkgname=ruby-$_gemname
pkgver=4.6.0
pkgrel=3
pkgdesc='Ruby SDK for the oVirt Engine API.'
arch=(x86_64)
url='https://rubygems.org/gems/ovirt-engine-sdk'
license=(Apache-2.0)
depends=(curl glibc icu libxml2 ruby ruby-json xz zlib)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4ab79266194bdb4b2a1bf0ed22113de483bf33e5272e5f97b33c229cfa66aaee')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem \
   -- --with-cflags="-Wno-int-conversion -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}


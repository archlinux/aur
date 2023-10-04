# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-vmfusion
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc='This library can be used as a module for fog or as standalone provider to use the VMWARE FUSION in applications.'
arch=(any)
url='https://rubygems.org/gems/fog-vmfusion'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fission)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('a842b47e162e915fbee76b08acec344d092802c5d32bc57a46b11b3d122491c74f5a04ef31201d4798abd6806ac5be947efbe9def51be62f1c2b7950f7cfc22a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

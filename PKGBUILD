# Maintainer: Olivier Biesmans <olivier at biesmans dot fr>
_gemname=hitimes
pkgname=ruby-$_gemname
pkgver=1.2.1
pkgrel=1
pkgdesc="Hitimes is a fast, high resolution timer library for recording performance metrics."
arch=(any)
url="https://rubygems.org/gems/hitimes"
license=('GPL')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=(1db864ae4d8229b38d17c8a206f26e813c2574fa7c7e1f1bb2ba2d12067fa63b)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

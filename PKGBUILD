# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
_gemname=discid
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=3
pkgdesc="Ruby bindings for the MusicBrainz DiscID library libdiscid."
arch=(any)
url="https://github.com/phw/ruby-discid"
license=('LGPL3')
depends=(ruby ruby-ffi libdiscid) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=(4c6d2a1cd5d751fa373f16ca2b74d9ae)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

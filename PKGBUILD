# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
_gemname=discid
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=2
pkgdesc="Ruby bindings for the MusicBrainz DiscID library libdiscid."
arch=(any)
url="https://github.com/phw/ruby-discid"
license=('LGPL3')
depends=(ruby ruby-ffi libdiscid) # Full dependency information is available in the yaml specification
makedepends=(rubygems ruby-rdoc)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=(35bd45adad20ac50293e10926af0bac0e0f4057513d605d3908d996dfece9d01)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

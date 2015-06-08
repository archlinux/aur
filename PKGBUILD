# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

_gemname=reedb
pkgname=ruby-$_gemname
pkgver=0.10.rc1
pkgrel=1
pkgdesc="Secure ruby database/ storage container for sensitive local user data"
arch=(any)
url="https://github.com/tr-lonelyrobot/reedb"
license=('LGPL')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=(f9d36539e3cc564b988973a9c6cc1500aa67c3c690c3681e34b83a9c320cbedf)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

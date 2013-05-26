# Maintainer: Sven Schneider <youremail@domain.com>

_gemname=autoproj
pkgname=ruby-$_gemname
pkgver=1.9.2
pkgrel=1
pkgdesc="Allows to easily install and maintain software that is under source code form (usually from a version control system)."
arch=(any)
url="http://rock-robotics.org/stable/documentation/autoproj/"
license=('GPL')
depends=(ruby ruby-autobuild ruby-highline ruby-utilrb)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=(aac2c804bc78dc9bdb74ebc0978494c1)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

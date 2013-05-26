# Maintainer: Sven Schneider <youremail@domain.com>

_gemname=autobuild
pkgname=ruby-$_gemname
pkgver=1.7.2
pkgrel=1
pkgdesc="Collection of classes to handle build systems (CMake, autotools, ...) and import mechanisms (tarballs, CVS, SVN, git, ...)."
arch=(any)
url="http://rock-robotics.org/stable/documentation/autoproj/"
license=('GPL')
depends=(ruby ruby-highline ruby-utilrb)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=(f990fd9034de97ac6f9dc3b32734b197)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

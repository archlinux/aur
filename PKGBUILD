# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Ruby_Gem_Package_Guidelines for more
# information on Ruby Gem packaging.

# Maintainer: Your Name <youremail@domain.com>
_gemname=droplet_ctl
pkgname=ruby-${_gemname}-git
pkgver=0.0.1
pkgrel=1
pkgdesc=""
arch=(any)
url=""
license=('MIT')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=("git://github.com/jreinert/${_gemname}.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_gemname"
  ruby -r './lib/droplet_ctl' -e 'puts DropletCtl::VERSION'
}

package() {
  cd "$srcdir/${_gemname}"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem build ${_gemname}.gemspec
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

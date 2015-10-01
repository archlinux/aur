# Maintainer: Aoibhinn di Tori <email@aoibh.in>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux(at)free.fr>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
_gemname=json
pkgname=ruby-$_gemname
pkgver=1.8.3
pkgrel=1
arch=('any')
pkgdesc='JSON implementation as a Ruby extension in C'
url='http://flori.github.io/json/'
license=('GPL')
depends=('ruby')
optdepends=('jruby' 'java-environment')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
md5sums=('3d076c3efb7545020230e9c1de8ef284')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  # Removing files with references to $pkgdir
  find "$pkgdir" -depth -type f -name "Makefile*" -exec rm {} \;
}

# vim:set ts=2 sw=2 et:

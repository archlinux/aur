# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux(at)free.fr>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
_gemname=json
pkgname=ruby-$_gemname
pkgver=1.8.2
pkgrel=1
arch=('any')
pkgdesc='JSON implementation as a Ruby extension in C'
url='http://flori.github.io/json/'
license=('GPL')
depends=('ruby')
optdepends=('jruby' 'java-environment')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('256f73d107635f54e3dd84daba65da7b08f9d6a6e6aeb046db6a46b98bd8fb7f')

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

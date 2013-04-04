# Contributor: Leonidas <marek@xivilization.net>
pkgname=homesick
pkgver=0.7.0
pkgrel=1
pkgdesc="A man's home is his castle. Never leave your dotfiles behind."
arch=(any)
url="http://github.com/technicalpickles/homesick"
license=('MIT')
depends=(ruby ruby-thor)
# well, rubygems is part of the ruby package nowadays, but *shrug*
makedepends=(rubygems)
source=(http://rubygems.org/downloads/homesick-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
sha512sums=('a7876c9df40e5fe4d1e0de1249196cc57bb80a6f608a927ce97cfaf21b68de8e728cb974eb98cd18f3332d4e0c4d8937d837dd94d3d99a0dff3071b66cdcfafe')

build() {
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  #  makepkg will barf when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  # we want to write the 'homesick' binary to the $PATH
  local _bindir="${pkgdir}/usr/bin"

  gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}${_gemdir}" \
    --bindir "${_bindir}" \
    ${pkgname}-${pkgver}.gem
}

# Contributor: Leonidas <marek@xivilization.net>
_gemname=homesick
pkgname=${_gemname}
pkgver=0.9.4
pkgrel=1
pkgdesc="A man's home is his castle. Never leave your dotfiles behind."
arch=(any)
url="http://github.com/technicalpickles/homesick"
license=('MIT')
depends=(ruby ruby-thor)
# well, rubygems is part of the ruby package nowadays, but *shrug*
makedepends=(rubygems)
source=(http://rubygems.org/downloads/${pkgname}-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
sha512sums=('6f4914752f9483a0bb56f53df3a7ca435407c9f30352ae554ac63e35074979236ebaa666b24f4fd76ff741e633c8533390396700320733e79bc79486c571c808')

package() {
  cd "${srcdir}"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system makepkg will barf when sourcing the PKGBUILD.
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

# Contributor: Leonidas <marek@xivilization.net>
_gemname=homesick
pkgname=${_gemname}
pkgver=1.1.0
pkgrel=1
pkgdesc="A man's home is his castle. Never leave your dotfiles behind."
arch=(any)
url="http://github.com/technicalpickles/homesick"
license=('MIT')
depends=(ruby ruby-thor git)
# well, rubygems is part of the ruby package nowadays, but *shrug*
makedepends=(rubygems)
source=(http://rubygems.org/downloads/${pkgname}-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
sha512sums=('15f16c2b3a3f8f1ac6d0db3155513ebaa2ffd6e21bf0915bf03cbfc7952185e053e500202a44117c982f3f6f89454c6d0a875e8855dd48d17922c5474ad3cbd1')

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

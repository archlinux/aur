# Contributor: Leonidas <marek@xivilization.net>
_gemname=homesick
pkgname=${_gemname}
pkgver=1.1.2
pkgrel=1
pkgdesc="A man's home is his castle. Never leave your dotfiles behind."
arch=(any)
url="http://github.com/technicalpickles/homesick"
license=('MIT')
depends=(ruby ruby-thor git)
# well, rubygems is part of the ruby package nowadays, but *shrug*
makedepends=(rubygems)
source=(https://rubygems.org/downloads/${pkgname}-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
sha512sums=('13eb0f1da5a724179e44b052a151623c813a3dffbde7bade54d82d6cc532ab8ba15e11acda606d49ff75667d18cdd8d46c32637001fc89d883b81d91e669e5c8')

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

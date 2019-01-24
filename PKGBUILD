# Contributor: Leonidas <marek@xivilization.net>
_gemname=homesick
pkgname=${_gemname}
pkgver=1.1.6
pkgrel=1
pkgdesc="Your home directory is your castle. Don't leave your dotfiles behind."
arch=(any)
url="https://github.com/technicalpickles/homesick"
license=('MIT')
depends=(ruby ruby-thor git)
# well, rubygems is part of the ruby package nowadays, but *shrug*
makedepends=(rubygems)
source=(https://rubygems.org/downloads/${pkgname}-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
sha512sums=('c1a341a4b170e67dc4496742d4009aad3e3a38f13aa63d1bf95d9e25708d6cd87bfe543d8f18a9923dae1c7b7af6fc8dead2f45270a673d82028e5da0a826e24')

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

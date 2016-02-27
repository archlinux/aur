# Contributor: Leonidas <marek@xivilization.net>
_gemname=homesick
pkgname=${_gemname}
pkgver=1.1.3
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
sha512sums=('7431060c5773b8c462eefbc1902158fd94ec8ded91b00fd8efef164a449c3b2003ac4a3553408c9aef4c5e72148a2397cf962825cf1f829b84ed911b68f39aaa')

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

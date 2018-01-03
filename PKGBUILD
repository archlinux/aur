# Maintainer: Maxime Gauduin <alucryd@gmail@com>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Contributor: Guilherme Nogueira <guilherme@nirev.org>

pkgname=ruby-treetop
pkgver=1.6.8
pkgrel=3
pkgdesc='A Ruby-based text parsing and interpretation DSL'
arch=('any')
url='http://treetop.rubyforge.org/'
license=('MIT')
depends=('ruby-polyglot')
options=('!emptydirs')
source=("http://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-$pkgver.gem")
sha256sums=('385cbbf3827a0a8559e4c79db0f0f88993dca5e8ce46cf08f1baccb61ac6a3cf')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} -n "${pkgdir}"/usr/bin ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -s ${_gemdir}/gems/${pkgname#*-}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:

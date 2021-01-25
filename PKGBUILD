# Maintainer: Maxime Gauduin <alucryd@gmail@com>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Contributor: Guilherme Nogueira <guilherme@nirev.org>

pkgname=ruby-treetop
pkgver=1.6.11
pkgrel=1
pkgdesc='A Ruby-based text parsing and interpretation DSL'
arch=('any')
url='https://github.com/cjheath/treetop'
license=('MIT')
depends=('ruby-polyglot')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-$pkgver.gem")
sha256sums=('102e13adf065fc916eae60b9539a76101902a56e4283c847468eaea9c2c72719')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} -n "${pkgdir}"/usr/bin ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -s ${_gemdir}/gems/${pkgname#*-}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:

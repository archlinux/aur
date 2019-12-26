# Maintainer: Maxime Gauduin <alucryd@gmail@com>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Contributor: Guilherme Nogueira <guilherme@nirev.org>

pkgname=ruby-treetop
pkgver=1.6.10
pkgrel=3
pkgdesc='A Ruby-based text parsing and interpretation DSL'
arch=('any')
url='http://treetop.rubyforge.org/'
license=('MIT')
depends=('ruby-polyglot')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-$pkgver.gem")
sha256sums=('67df9f52c5fdeb7b2b8ce42156f9d019c1c4eb643481a68149ff6c0b65bc613c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} -n "${pkgdir}"/usr/bin ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -s ${_gemdir}/gems/${pkgname#*-}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:

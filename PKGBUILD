# Maintainer: Maxime Gauduin <alucryd@gmail@com>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Contributor: Guilherme Nogueira <guilherme@nirev.org>

pkgname=ruby-treetop
pkgver=1.5.3
pkgrel=3
pkgdesc='A Ruby-based text parsing and interpretation DSL'
arch=('any')
url='http://treetop.rubyforge.org/'
license=('MIT')
depends=('ruby-polyglot')
options=('!emptydirs')
source=("http://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-$pkgver.gem")
sha256sums=('ab3c49c3a39e7c9bea88a90524545e39bed032758a130295f8d6a433c62ff472')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} -n "${pkgdir}"/usr/bin ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -s ${_gemdir}/gems/${pkgname#*-}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:

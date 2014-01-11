# Maintainer: Maxime Gauduin <alucryd@gmail@com>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Contributor: Guilherme Nogueira <guilherme@nirev.org>

pkgname=ruby-treetop
pkgver=1.4.15
pkgrel=4
pkgdesc='A Ruby-based text parsing and interpretation DSL'
arch=('any')
url='http://treetop.rubyforge.org/'
license=('MIT')
depends=('ruby-polyglot')
source=("http://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-$pkgver.gem")
sha256sums=('ffa68f201c0f62c26b0a1d13233d73194400596964696843f87ebb5d812f12ff')

prepare() {
  gem install --no-{document,user-install} --ignore-dependencies -i . ${pkgname#*-}-${pkgver}.gem
}

package() {
  cd gems/${pkgname#*-}-${pkgver}

  local _rubyver="$(ruby --version | sed 's/.* \(.*\..*\..*\)p.*/\1/')"

  install -dm 755 "${pkgdir}"/usr/lib/ruby/{gems/${_rubyver},vendor_ruby}
  mv bin "${pkgdir}"/usr/
  mv lib "${pkgdir}"/usr/lib/ruby/vendor_ruby/${_rubyver}

# Gem compatibility
  mv ../../specifications "${pkgdir}"/usr/lib/ruby/gems/${_rubyver}/

# License
  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 {,"${pkgdir}"/usr/share/licenses/${pkgname}/}LICENSE
}

# vim: ts=2 sw=2 et:

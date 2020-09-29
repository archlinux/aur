# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='rr'
pkgname="ruby-${_gemname}"
pkgver=1.2.1
pkgrel=2
pkgdesc='RR is a test double framework that features a rich selection of double techniques and a terse syntax'
arch=('any')
url='https://github.com/rr/rr'
license=('MIT')
# ruby-rr requires ruby-test-unit-rr to run it's tests.
# ruby-test-unit-rr already has ruby-rr as a runtime dependency
makedepends=('ruby-rdoc' 'ruby-rake' 'ruby-bundler')
checkdepends=('ruby-test-unit-rr' 'ruby-rspec' 'ruby-test-unit')
depends=('ruby')
options=(!emptydirs)
source=("https://github.com/rr/rr/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('df2d05ff732908da55878cb89cb7d1c4442a18c19f71940244f5bd7dc55632467a1824f55d7fade4b5122486a61277090d7ad05df9f99098030c21aa45b36dd2')

#prepare() {
#  cd "${_gemname}-${pkgver}"
#}

build() {
  cd "${_gemname}-${pkgver}"
  rake build
}

check() {
  cd "${_gemname}-${pkgver}"
  rake test
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 README.md CHANGES.md CREDITS.md FOR_DEVELOPERS.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

_gemname=hitimes
pkgname=ruby-${_gemname}
pkgver=1.2.4
pkgrel=2
pkgdesc='Fast, high resolution timer library for recording performance metrics'
url='https://github.com/copiousfreetime/hitimes'
arch=('i686' 'x86_64')
license=('ISC')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/copiousfreetime/hitimes/archive/v${pkgver}.tar.gz)
sha512sums=('8d4c6ab8a56d8fee5e3968d07a344ec9407dcca2bf18847740f6a53a665980b387dbdf70d0cb5535254b231edacd686dd9aeb7e584e2c5217f616c2333fc1891')

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}/${_gemdir}" \( -name '*.log' -or -name 'gem_make.out' \) -delete
}

# vim: ts=2 sw=2 et:

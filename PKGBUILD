# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=packetfu
pkgname=ruby-${_gemname}
pkgver=1.1.11
pkgrel=1
pkgdesc='Library for reading and writing packets to an interface or to a libpcap-formatted file'
url='https://github.com/packetfu/packetfu'
arch=('any')
license=('BSD')
depends=('ruby' 'ruby-network_interface' 'ruby-pcaprub')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/packetfu/packetfu/archive/version-${pkgver}.tar.gz)
sha512sums=('c1144b11e3b4020a96ad7a73b299b06fbe51a8e0a81ff2ddbef8f82268bbe2edd8497eb4f69cb66078ce724e41d0d1105571e0462794d11ca42b7da573753837')

prepare() {
  cd ${_gemname}-version-${pkgver}
  sed 's|git ls-files|find|' -i *.gemspec
}

build() {
  cd ${_gemname}-version-${pkgver}
  gem build packetfu.gemspec
}

package() {
  cd ${_gemname}-version-${pkgver}
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" packetfu*.gem
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rdoc -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}

# vim: ts=2 sw=2 et:

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap
pkgver=1.5.7
pkgrel=1
pkgdesc='Complete, modular, portable and easily extensible MITM framework'
url='https://github.com/evilsocket/bettercap'
arch=('any')
license=('GPL3')
depends=('net-tools' 'ruby' 'ruby-network_interface' 'ruby-pcaprub' 'ruby-packetfu' 'ruby-colorize' 'ruby-net-dns' 'ruby-em-proxy' 'ruby-rubydns')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/evilsocket/bettercap/archive/v${pkgver}.tar.gz)
sha512sums=('93e1b670f5f183309a61be838c6a398defe93b16fb022d9143844808781377d1da281f7cd7212983a44592ecedb8a32f3aecd55562ccd5433b6ed51c32cd94cc')

build() {
  cd ${pkgname}-${pkgver}
  gem build bettercap.gemspec
}

package() {
  cd ${pkgname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" bettercap*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

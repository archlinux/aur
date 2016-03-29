# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap
pkgver=1.5.3
pkgrel=1
pkgdesc='Complete, modular, portable and easily extensible MITM framework'
url='https://github.com/evilsocket/bettercap'
arch=('any')
license=('GPL3')
depends=('ruby' 'ruby-network_interface' 'ruby-pcaprub' 'ruby-packetfu' 'ruby-colorize' 'ruby-net-dns' 'ruby-em-proxy') # 'ruby-rubydns'
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/evilsocket/bettercap/archive/v${pkgver}.tar.gz)
sha512sums=('16d9e263c6a238d83a59f78b870324bc5a4133f778bfcc1ce99646887970a65ad1ee08e411ece680098622713a71b6a699b3359e1bd21f4ab7e312dc32ea3ed1')

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

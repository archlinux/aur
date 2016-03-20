# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap
pkgver=1.5.1
pkgrel=1
pkgdesc='Complete, modular, portable and easily extensible MITM framework'
url='https://github.com/evilsocket/bettercap'
arch=('any')
license=('GPL3')
depends=('ruby' 'ruby-network_interface' 'ruby-pcaprub' 'ruby-packetfu' 'ruby-colorize' 'ruby-net-dns' 'ruby-em-proxy') # 'ruby-rubydns'
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/evilsocket/bettercap/archive/v${pkgver}.tar.gz)
sha512sums=('282c7dd5da347aef3c322c0beff1e625eafb0696454ce43ecfd9657cb7b10130911c4aec026a6effa2de15ef3937a28b3d9360ba665a5f8d1a1dfa730fbb0a69')

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

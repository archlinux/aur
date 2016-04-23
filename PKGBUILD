# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap
pkgver=1.5.4
pkgrel=1
pkgdesc='Complete, modular, portable and easily extensible MITM framework'
url='https://github.com/evilsocket/bettercap'
arch=('any')
license=('GPL3')
depends=('net-tools' 'ruby' 'ruby-network_interface' 'ruby-pcaprub' 'ruby-packetfu' 'ruby-colorize' 'ruby-net-dns' 'ruby-em-proxy' 'ruby-rubydns')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/evilsocket/bettercap/archive/v${pkgver}.tar.gz)
sha512sums=('a27b95557bd540539b818f34aa339af8fb52516242dbc25692decec9abb3e203dcdbebcfc81cbf0be84832d72c8b08dc6af33242365dc5607771536f035e989b')

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

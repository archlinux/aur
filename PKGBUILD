# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap
pkgver=1.4.6
pkgrel=1
pkgdesc='Complete, modular, portable and easily extensible MITM framework'
url='https://github.com/evilsocket/bettercap'
arch=('any')
license=('GPL3')
depends=('ruby' 'ruby-network_interface' 'ruby-pcaprub' 'ruby-packetfu' 'ruby-colorize' 'ruby-net-dns') # 'ruby-rubydns'
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/evilsocket/bettercap/archive/v${pkgver}.tar.gz)
sha512sums=('2c68934643fbeac49cbc8967530272748f70f7cb2b4fea9cb4f321aaf731e88151044ff8aa832f1327b3bd6a85cb196de4e622a99bb36b129a81e2dd3391ecd4')

build() {
  cd ${pkgname}-${pkgver}
  gem build bettercap.gemspec
}

package() {
  cd ${pkgname}-${pkgver}
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" bettercap*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

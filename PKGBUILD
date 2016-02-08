# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=ruby-network_interface
_pkgname=network_interface
pkgver=0.0.1
pkgrel=1
pkgdesc='Library to get network interface information'
url='https://github.com/rapid7/network_interface'
arch=('any')
license=('MIT')
depends=('ruby')
makedepends=('git')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rapid7/network_interface/archive/v${pkgver}.tar.gz)
sha512sums=('d6ef7b82b2e3b4834b1eede2734bbef80c5a635ac62db33b3b3ba5660910c4cbc38c270e3b4e5be039217ba20e7064da172869cf7553a62db9526bcb43bf1013')

build() {
  cd ${_pkgname}-${pkgver}
  gem build network_interface.gemspec
}

package() {
  cd ${_pkgname}-${pkgver}
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" network_interface*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

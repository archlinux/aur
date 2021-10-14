# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=rspec
pkgname=ruby27-${_gemname}
pkgver=3.10.0
pkgrel=1
pkgdesc='RSpec meta-gem that depends on the other components'
url='https://github.com/rspec/rspec'
arch=('any')
license=('MIT')
depends=('ruby27-rspec-core' 'ruby27-rspec-expectations' 'ruby27-rspec-mocks')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('dd1a3a1c7c73ae9c053e071d7851780d8cf61e92ddba24072b9f2c00a342ed08c81090332ba2eaf7ab96adac3fc723685996195e5cc584e15de57ff02a4455ec')

package() {
  local _gemdir="$(ruby-2.7 -e'puts Gem.default_dir')"
  gem-2.7 install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:

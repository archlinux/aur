# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=rspec-core
pkgname=ruby27-${_gemname}
pkgver=3.10.1
pkgrel=2
pkgdesc='RSpec runner and formatters'
url='https://github.com/rspec/rspec-core'
arch=('any')
license=('MIT')
depends=('ruby27-rspec-support')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('46808d37736b5f30d562b4014638cbf2d1a7d7432730c6c727a6e539f63ee21a04185610034fff4d938a948a887ba6a626955963add6b5e9b5f64499732d742a')

package() {
  local _gemdir="$(gem-2.7 environment gemdir)"
  gem-2.7 install --ignore-dependencies --no-user-install --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  mv "${pkgdir}/usr/bin/rspec" "${pkgdir}/usr/bin/ruby27-rspec"

}

# vim: ts=2 sw=2 et:

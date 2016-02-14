# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=net-dns
pkgname=ruby-${_gemname}
pkgver=0.8.0
pkgrel=1
pkgdesc='Pure Ruby DNS library, with a clean OO interface and an extensible API'
url='https://github.com/bluemonk/net-dns'
arch=('any')
license=('BSDL')
depends=('ruby')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('734fdfaa487ac551acdc9c790560cd19e84886b12b07b932a94473cfa473cfd3d4fd91ea9679ee0082ae772fe6cef2d09a0b3511b842c0f0e9ba858771df726e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/"{CHANGELOG.md,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:

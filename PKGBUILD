# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=rspec-mocks
pkgname=ruby27-${_gemname}
pkgver=3.10.2
pkgrel=1
pkgdesc="RSpecs 'test double' framework, with support for stubbing and mocking"
url='https://github.com/rspec/rspec-mocks'
arch=('any')
license=('MIT')
depends=('ruby27-rspec-support' 'ruby27-diff-lcs')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('a40a14842bc98d1da767e899a5ffb6aca649202549ab53fe59d83e83d35f0ff902dd8631a0a557806e68b573c6b425f650142faad2b60ced6f6863b8adbff1fd')

package() {
  local _gemdir="$(ruby-2.7 -e'puts Gem.default_dir')"
  gem-2.7 install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  find "${pkgdir}"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:

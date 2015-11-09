# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_gemname=fit-commit
pkgname="ruby-${_gemname}"
pkgver=3.3.0
pkgrel=1
pkgdesc='A Git hook to validate your commit messages'
arch=('any')
url='https://github.com/m1foley/fit-commit'
license=('MIT')
depends=('ruby' 'ruby-swearjar')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
provides=("${_gemname}=${pkgver}")
install="${pkgname}.install"
sha256sums=('9f9702fad451c452ed4ef2948868ce5a2ef9177695d2c2e958d5abe8f7464ecb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:

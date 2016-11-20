# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_gemname=fit-commit
pkgname="ruby-${_gemname}"
pkgver=3.6.1
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
sha256sums=('94c10cf969743e81460f99cde1d4031aff1d684c65726b97cc8f4b2f46b0e975')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:

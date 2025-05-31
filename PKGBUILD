# Maintainer: Kevin McCormack <kevin[at]mccormack[dot]tech>

_gemname=amdgpu_fan
pkgname=ruby-${_gemname}
pkgver=0.9.0
pkgrel=2
pkgdesc='A CLI for interacting with the amdgpu Linux driver written in Ruby'
url='https://github.com/HarlemSquirrel/amdgpu-fan-rb'
arch=('any')
license=('MIT')
depends=(
  ruby
  ruby-async
  ruby-thor
)
makedepends=(
  ruby-rdoc
)
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('3bad08073fa48d3ea44497c034c91b431117e401f77ec286db5c4bfae225dadf93e99fa4f9dc68b156d40e1e8a86f781b127aab90f073363277efc01cf418eab')

package() {
  # Use the system ruby version from /usr/bin/gem to avoid conflicts with
  # other version managers like rvm or mise.
  local _gemdir="$(/usr/bin/gem environment gemdir)"
  mkdir -p "${pkgdir}/usr/bin"
  /usr/bin/gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:

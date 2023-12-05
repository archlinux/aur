# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

_gemname=oci
pkgname=ruby-${_gemname}
pkgver=2.20.0
pkgrel=1
pkgdesc='Ruby SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-ruby-sdk'
license=('Apache')
depends=('ruby' 'ruby-inifile' 'ruby-jwt')
makedepends=('ruby-rdoc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5cf6e8ba8bb6e1a6d893178db9fbea2743cc0491418138b0b2bc702e7f461ce7')

build() {
  cd "${_gemname}-ruby-sdk-${pkgver}"

  gem build ${_gemname}.gemspec
}

package() {
  cd "${_gemname}-ruby-sdk-${pkgver}"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

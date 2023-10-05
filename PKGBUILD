# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

_gemname=oci
pkgname=ruby-${_gemname}
pkgver=2.19.0
pkgrel=1
pkgdesc='Ruby SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-ruby-sdk'
license=('Apache')
depends=('ruby' 'ruby-inifile' 'ruby-jwt')
makedepends=('ruby-rdoc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d67ddb7173e740bd18d91de42ccd5953dacc0e922cb9ebf76bf2c8b2d8dc92c5')

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

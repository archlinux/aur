# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

_gemname=oci
pkgname=ruby-${_gemname}
pkgver=2.12.0
pkgrel=1
pkgdesc='Ruby SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-ruby-sdk'
license=('Apache')
depends=('ruby-rdoc' 'ruby-inifile' 'ruby-jwt')
makedepends=('ruby-rake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3e7d4a67f230dfeec6df4ba0c121d89e89d9cc5e9efb5d24eb0d1c1d3c8bfb2b')

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

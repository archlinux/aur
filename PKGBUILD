# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

_gemname=oci
pkgname=ruby-${_gemname}
pkgver=2.5.8
pkgrel=1
pkgdesc='Ruby SDK for Oracle Cloud Infrastructure'
arch=('x86_64')
url='https://github.com/oracle/oci-ruby-sdk'
license=('Apache')
depends=('ruby-rdoc' 'ruby-inifile' 'ruby-jwt')
makedepends=('ruby-rake' 'ruby-rdoc')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('036002cbcfadd36cecb904bc91ad3b14dff3b745720a7e4db024912ac646a62a')

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

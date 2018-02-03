# Maintainer: Louis Bettens louis at bettens dot info

__github='https://github.com/paddor/czmq-ffi-gen'
_gemname=czmq-ffi-gen
pkgname=ruby-${_gemname}
pkgver=0.14.1
pkgrel=1
pkgdesc='low-level Ruby binding for CZMQ'
url=${__github}
arch=('any')
license=('ISC')
depends=('czmq' 'ruby' 'ruby-ffi')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::${__github}/archive/v${pkgver}.tar.gz)
sha256sums=('deed2095fd22e7650fea684617182d8d524c642904edf9f06b28382b437effec')
sha512sums=('4cce5a874c077fb045158d16658d16092be27fda3cf938f3a699fe85a23105c119d0114beba867baf73069a0472681642f7aff97ac330ef8541d2b548249bf91')

prepare() {
  cd ${_gemname}-${pkgver}
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}


package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# Maintainer: Louis Bettens louis at bettens dot info

__github='https://github.com/paddor/cztop'
_gemname=cztop
pkgname=ruby-${_gemname}
pkgver=0.12.2
pkgrel=1
pkgdesc='CZMQ Ruby binding, based on the generated low-level FFI bindings of CZMQ'
url=${__github}
arch=('any')
license=('ISC')
depends=('ruby' 'czmq')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::${__github}/archive/v${pkgver}.tar.gz)
sha256sums=('af8bd2044892f535eae3a509dc94b07a1aaae86b20edf035d32733376e4ef58b')
sha512sums=('af5c9aa15df526d0068b430e430e9bb24e2b3651eda3e495c3d49cf80d9af3229d1a664815de78ca57898d69b2b3e77a0c11f847fcbaf14cb26b394f0e790998')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i ${_gemname}.gemspec
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

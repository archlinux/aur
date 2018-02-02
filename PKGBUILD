# Maintainer: Louis Bettens louis at bettens dot info

__github='https://github.com/cldwalker/bond'
_gemname=bond
pkgname=ruby-${_gemname}
pkgver=0.5.1
pkgrel=1
pkgdesc='Autocompleter for Ruby REPL'
url=${__github}
arch=('any')
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::${__github}/archive/v${pkgver}.tar.gz)
sha256sums=('52ac1babac3e7bac4eae9b006d1785b30c4faadd33b5f3660d09bb0e0a601cea')
sha512sums=('18605753888816f175f86f01df3413902f3b69396b5628160df621c6ccf1080f582083139fe003eab9de0f1626df66fb194374ed08983ca71db67db0d43e9d63')

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
  install -Dm 644 README.rdoc CHANGELOG.rdoc -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

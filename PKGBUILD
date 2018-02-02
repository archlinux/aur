# Maintainer: Louis Bettens louis at bettens dot info

__github='https://github.com/SciRuby/iruby'
_gemname=iruby
pkgname=ruby-${_gemname}
_gitcommit='49e3a23223280cf2d81a4a5686915655538bf7f8'
pkgver=0.3
pkgrel=1
pkgdesc='A Ruby kernel for Jupyter'
url=${__github}
arch=('any')
license=('MIT')
depends=('ruby-cztop')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::${__github}/archive/${_gitcommit}.tar.gz)
sha256sums=('7c93b7ddca64b87b61c00bbad0fc88e8aa271ef5a379bdadd1ad97b3f3fda058')
sha512sums=('681216c6fd913cc87d9d6c4c643917e263fb45b76ce03bc51120f294b4cdd43bb1acbeb1e8923d727cd43b8bb15a5b458678b14633f628de6525b6325d3e613a')

prepare() {
  cd ${_gemname}-${_gitcommit}
  sed 's|git ls-files|find|' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${_gitcommit}
  gem build ${_gemname}.gemspec
}


package() {
  cd ${_gemname}-${_gitcommit}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

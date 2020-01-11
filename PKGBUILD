# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='puppet-resource_api'
pkgname="ruby-${_gemname}"
pkgver=1.8.11
pkgrel=1
pkgdesc='This library provides a simple way to write new native resources for puppet.'
arch=('any')
url='https://github.com/puppetlabs/puppet-resource_api'
license=('Apache')
depends=('ruby' 'ruby-hocon')
makedepends=('ruby-rdoc')
checkdepends=('ruby-rake' 'ruby-rspec' 'ruby-bundler')
source=("${url}/archive/${pkgver}/${_gemname}-${pkgver}.tar.gz")
noextract=("$_gemname-$pkgver.gem")
options=("!emptydirs")
sha512sums=('5294384355d8a21fed597dbd97ea3c9a3d333cb0e57c23a1cbdbd56dbd42241abf7070d588d80162911bb4863aa5e0890f66bde7e68c1d126889b5142aba9a88')

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  # tests currently don't work because of outdated dependencies
  #rake test
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -r "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:

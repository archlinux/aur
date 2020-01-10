# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='sync'
pkgname="ruby-${_gemname}"
pkgver=0.5.0
pkgrel=2
pkgdesc='A Ruby module packaged asa gem that provides a two-phase lock with a counter.  Was in Ruby core until 2.7'
arch=('any')
url='https://github.com/ruby/sync'
license=('BSD')
depends=('ruby')
makedepends=('ruby-rdoc' 'ruby-rake' 'ruby-bundler')
checkdepends=('ruby-test-unit')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5f887d9169e0be834c7fa17ae42b71078f25ce3d83e695490cd136adc1799d6b92e4aed41ce3f3d57b3ad193a1ac4de940b37212c2864bbf6331ba3582128166')

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake test
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:

# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

_gemname='sync'
pkgname="ruby27-${_gemname}"
pkgver=0.5.0
pkgrel=1
pkgdesc='A Ruby module packaged as a gem that provides a two-phase lock with a counter.  Was in Ruby core until 2.7'
arch=('any')
url="https://github.com/ruby/${_gemname}"
license=('BSD')
depends=('ruby2.7')
makedepends=('ruby27-rdoc' 'ruby27-rake')
checkdepends=('ruby27-test-unit')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/ruby-${_gemname}-${pkgver}.tar.gz")
sha512sums=('5f887d9169e0be834c7fa17ae42b71078f25ce3d83e695490cd136adc1799d6b92e4aed41ce3f3d57b3ad193a1ac4de940b37212c2864bbf6331ba3582128166')

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem-2.7 build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  ruby27-rake test
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_gemname=timers
pkgname=ruby-${_gemname}
pkgver=4.1.2
pkgrel=4
pkgdesc='Schedule procs to run after a certain time, or at periodic intervals, using any API that accepts a timeout'
url='https://github.com/celluloid/timers'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-hitimes')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/timers/archive/v${pkgver}.tar.gz)
sha512sums=('4f3fae32e868fbf87a4e02767b3ebdb04a30596f3668d8e0d1ad70d59e3c590de42a89d9773e6a830cf34ab68f063663839775a5618e832b871dc976c670e6af')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:

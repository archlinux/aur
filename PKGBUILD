# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_gemname=timers
pkgname=ruby-${_gemname}
pkgver=4.1.1
pkgrel=2
pkgdesc='Schedule procs to run after a certain time, or at periodic intervals, using any API that accepts a timeout'
url='https://github.com/celluloid/timers'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-hitimes')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/timers/archive/v${pkgver}.tar.gz)
sha512sums=('3daa30e003f55cb534813dbd18527badbf527befca2ce15ed696d88a3fdceb85dd871329e38d743e1c57c309c2b23692996586bb5864b442eb72608dd7f51c76')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i *.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build timers.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" timers*.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:

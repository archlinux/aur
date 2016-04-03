# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=celluloid-dns
pkgname=ruby-${_gemname}
pkgver=0.17.3
pkgrel=1
pkgdesc='Simple finite state machines with integrated Celluloid timeout support'
url='https://github.com/celluloid/celluloid-dns'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-timers' 'ruby-celluloid' 'ruby-celluloid-io' 'ruby-rspec-core')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/celluloid-dns/archive/v${pkgver}.tar.gz)
sha512sums=('5aa436db250a2f3fe77c4d0afa1693bcfdf708d43e08e77e03896e9f7c40364ceea41c77fb1c10e40c019a1c10a15308b26e48c3588e6095fe01c7f8a1db3e12')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i *.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build celluloid-dns.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" celluloid-dns*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:

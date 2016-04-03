# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=rubydns
pkgname=ruby-${_gemname}
_pkgver=1.0.3
pkgver=1.0.3.af7984c
_gitcommit=af7984cd39a23445e6b2a19e2e12444c8d2f7d27
pkgrel=1
pkgdesc='High-performance asynchronous DNS server and resolver for Ruby'
url='https://github.com/ioquatix/rubydns'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-timers' 'ruby-celluloid' 'ruby-celluloid-io')
makedepends=('git')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ioquatix/rubydns/archive/${_gitcommit}.tar.gz)
sha512sums=('3795bd482916db229d4c399f82bd2646c72b828727ff0267f9f3073b4403b8169356f7df7bbce7d6890e715099b9c61008a3685b054dcdb3ac191059f297d33b')

prepare() {
  cd ${_gemname}-${_gitcommit}
  sed 's|git ls-files|find|' -i *.gemspec
}

build() {
  cd ${_gemname}-${_gitcommit}
  gem build rubydns.gemspec
}

package() {
  cd ${_gemname}-${_gitcommit}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" rubydns*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}"/${_gemdir}/cache/${_gemname}-*.gem
}

# vim: ts=2 sw=2 et:

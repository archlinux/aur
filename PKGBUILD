# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

_gemname=minitest
pkgname=ruby27-${_gemname}
_gitcommit=b8fb1014ad1932eddefb5107c0f6504ba45e0cbc
pkgver=5.14.3
pkgrel=3
pkgdesc='Complete suite of testing facilities supporting TDD, BDD, mocking, and benchmarking'
url='https://github.com/seattlerb/minitest'
arch=('any')
license=('MIT')
depends=('ruby2.7')
makedepends=('git' 'ruby27-rake' 'ruby27-rdoc' 'ruby27-hoe')
options=('!emptydirs')
source=("git+https://github.com/seattlerb/minitest#commit=${_gitcommit}")
sha512sums=('SKIP')

pkgver() {
  cd ${_gemname}
  grep 'VERSION = "' lib/minitest.rb|sed -E 's|.*"(.+)".*|\1|'
}

build() {
  cd ${_gemname}
  ruby27-rake gem
}

check() {
  cd ${_gemname}
  ruby27-rake test
}

package() {
  cd ${_gemname}
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" pkg/${_gemname}-${pkgver}.gem
  install -Dm 644 README.rdoc History.rdoc -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 README.rdoc -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:

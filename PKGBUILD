# Maintainer: prochac <tomas.prochazka5d[at]gmail[dot]com>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>

_gitname=vuln
pkgname=govulncheck-git
pkgver=1.1.3
pkgrel=3
pkgdesc='Database client and tools for the Go vulnerability database'
url='https://go.googlesource.com/vuln/'
arch=('x86_64')
license=('BSD-3-Clause')
makedepends=('go' 'git')
provides=('govulncheck')
conflicts=('govulncheck')
source=(git+http://go.googlesource.com/${_gitname}/)
b2sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo ${pkgver}
}

prepare() {
  cd "${srcdir}/${_gitname}"
  # Checkout the specific tag
  git checkout "v${pkgver}"
}

build() {
  cd ${_gitname}
  go build -o govulncheck ./cmd/govulncheck
}

package() {
  cd ${_gitname}
  install -Dm 755 govulncheck -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:

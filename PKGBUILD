# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>

pkgname=openring-git
_pkgname=openring
pkgver=r13.51c8a2e1
pkgrel=1
pkgdesc="A webring for static site generators"
arch=('x86_64')
url="https://sr.ht/~sircmpwn/openring/"
conflicts=('openring')
provides=('openring')
license=('GPL3')
makedepends=('go' 'git')
source=('git+https://git.sr.ht/~sircmpwn/openring')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local count="$(git rev-list --count HEAD)"
  local rev="$(git rev-parse --short HEAD)"
  echo "r$count.g$rev"
}

build() {
  cd "${srcdir}/${_pkgname}"
  GOPATH="${srcdir}/go" GOCACHE="${srcdir}/cache" go build -o "${_pkgname}"
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSES"/* -t "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES"
}

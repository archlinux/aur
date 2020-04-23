# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='powerline-go-git'
_pkgname='powerline-go'
pkgver=1.16.1.0.g679d788
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('git' 'go')
provides=('powerline-go')
conflicts=('powerline-go')
source=($_pkgname::'git+https://github.com/justjanne/powerline-go.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

build() {
  cd "${_pkgname}"
  go build \
  -trimpath \
  -ldflags "-extldflags ${LDFLAGS}" \
  .
}

package() {
  cd "${_pkgname}"
  install -m755 -D powerline-go "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:

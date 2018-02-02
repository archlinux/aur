# Maintainer: Terin Stock <terinjokes@gmail.com>
# Contributor: Tom Tobin <archlinux@tomxtobin.com>

pkgname=dep
pkgver=0.4.1
pkgrel=2
_commitHash="37d9ea0ac16f0e0a05afc3b60e1ac8c364b6c329"
_commitDate="2018-01-25"
pkgdesc="Go dependency tool"
arch=('x86_64' 'i686')
url="https://github.com/golang/dep"
license=('BSD')
makedepends=('go')
options=('!strip' '!emptydirs')
provides=("dep")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/golang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('df9b050bf4dbb2a8cf04372097a68b04a6ae1986ed7c5086914ac86d74ea9d49')

_importpath='github.com/golang/dep'
_ldflags="-s -w -X main.buildDate=${_commitDate} -X main.commitHash=${_commitHash} -X main.version=v${pkgver}"

prepare() {
  if [[ ! -r ${_importpath} ]]; then
    mkdir -p "src/$(dirname "${_importpath}")"
    ln -sf  "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/${_importpath}"
  fi
}

build() {
  export GOPATH="$srcdir"
  go install -ldflags="${_ldflags}" "${_importpath}/cmd/dep"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "../bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

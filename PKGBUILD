# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mimemagic
pkgver=1.1.0
pkgrel=1
pkgdesc="Powerful and versatile MIME sniffing package using pre-compiled glob patterns, magic number signatures, XML document namespaces, and tree magic for mounted volumes, generated from the XDG shared-mime-info database"
arch=('x86_64')
url='https://github.com/zRedShift/mimemagic'
license=('MIT')
makedepends=('dep' 'go-pie')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3f20e5a7e28080c3dd23721d40d9d419509f26e38c69f11b2c9838c8b41a1927')

prepare() {
  mkdir -p gopath/src/github.com/${pkgname}
  ln -rTsf ${pkgname}-${pkgver} gopath/src/github.com/${pkgname}/${pkgname}
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname}/${pkgname}
  dep init -v
  dep ensure -v
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname}/${pkgname}/cmd/${pkgname}
  go install -v .
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
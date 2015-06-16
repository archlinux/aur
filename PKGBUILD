# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=imp
pkgver=1.3.0
pkgrel=2
pkgdesc="A simple command-line image manipulation program"
arch=('any')
url="http://jangler.info/code/${pkgname}"
license=('MIT')
makedepends=('go')
source=("https://github.com/jangler/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('154b1c0f6c361de13325ca10956a7ad6f74eb2f03c12a044f128550382762274')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p src/github.com/jangler/imp
  mv filter src/github.com/jangler/imp
  mv util src/github.com/jangler/imp
  GOPATH="${srcdir}/${pkgname}-${pkgver}" go build -o ${pkgname}
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

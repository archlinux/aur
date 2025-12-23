# Maintainer: Mark Pitman <mark@pitman.io>

pkgname=mdview
pkgver=1.7.0
pkgrel=1
pkgdesc="Markdown View"
arch=('x86_64')
url="https://github.com/mapitman/mdview"
license=('MIT')
provides=('mdview')
makedepends=('go' 'pandoc')
source=("https://github.com/mapitman/mdview/archive/${pkgver}.tar.gz")
sha256sums=('86d05116a73fc2d0f70b4fa2e262cefbe4e506731c611c68fcc30ec906a26aa4')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  sed -i 's/VERSION := $(shell git describe --tags --abbrev=0)//g' Makefile
  make VERSION=${pkgver} bin/linux-amd64/mdview
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd bin/linux-amd64/
  install -D -m 755 mdview ${pkgdir}/usr/bin/mdview
  install -D -m 644 mdview.1 ${pkgdir}/usr/share/man/man1/mdview.1
}

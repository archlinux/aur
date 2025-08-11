# Maintainer: Mark Pitman <mark@pitman.io>

pkgname=mdview
pkgver=1.6.4
pkgrel=1
pkgdesc="Markdown View"
arch=('x86_64')
url="https://github.com/mapitman/mdview"
license=('MIT')
provides=('mdview')
makedepends=('go' 'pandoc')
source=("https://github.com/mapitman/mdview/archive/${pkgver}.tar.gz")
sha256sums=('35e17d9f17c26b5a1f9b8d4cf978b80ab72fd300250b5cb8a7bbef6054d5a856')

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

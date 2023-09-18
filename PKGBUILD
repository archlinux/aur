# Maintainer: Mark Pitman <mark@pitman.io>

pkgname=mdview
pkgver=1.5.0
pkgrel=1
pkgdesc="Markdown View"
arch=('x86_64')
url="https://github.com/mapitman/mdview"
license=('MIT')
provides=('mdview')
makedepends=('go' 'pandoc')
source=("https://github.com/mapitman/mdview/archive/${pkgver}.tar.gz")
sha256sums=('ff15fb3dc055f94e7bef0bd3f1cf4f430fe9d0396584bcdecf1334c0ae0f21ff')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  sed -i 's/VERSION := $(shell git describe --tags --abbrev=0)//g' Makefile
  make VERSION=${pkgver} bin/linux-${arch}/mdview
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd bin/linux-${arch}/${pkgname}-${pkgver}
  install -D -m 755 mdview ${pkgdir}/usr/bin/mdview
  install -D -m 644 mdview.1 ${pkgdir}/usr/share/man/man1/mdview.1
}

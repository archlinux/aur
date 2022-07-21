# Maintainer: Steven Tang <xosdy.t at gmail dot com>

pkgname=zhparser
pkgver=2.2
pkgrel=1
pkgdesc="A PostgreSQL extension for full-text search of Chinese language (Mandarin Chinese)"
arch=(x86_64)
url="https://github.com/amutu/zhparser"
license=(PostgreSQL)
depends=(postgresql scws)
makedepends=(llvm)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amutu/zhparser/archive/refs/tags/V${pkgver}.tar.gz")
sha256sums=('1d0b0e834a3d0406a1c520e5b80886cd1c0bf3649d59f13b5f60e8c872a54a31')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's:SCWS_HOME ?= /usr/local:SCWS_HOME ?= /usr:g' Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Steven Tang <xosdy.t at gmail dot com>

pkgname=zhparser
pkgver=2.3
pkgrel=1
pkgdesc="A PostgreSQL extension for full-text search of Chinese language (Mandarin Chinese)"
arch=(x86_64)
url="https://github.com/amutu/zhparser"
license=(PostgreSQL)
depends=(postgresql scws)
makedepends=(llvm clang)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amutu/zhparser/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96fe19f1b72c922eab19ecfc305384381562ff840da4d3b77452e21fefe8f0d2')

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

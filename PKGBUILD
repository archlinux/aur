# Maintainer: edoz90

pkgname=t50
_major=5
_minor=8
_build=2
pkgver="v${_major}.${_minor}.${_build}"
pkgrel=1
pkgdesc="T50 (f.k.a. F22 Raptor) is a tool designed to perform 'Stress Testing'"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://gitlab.com/fredericopissarra/t50"
license=('GPLv2')
provides=("t50")

source=("${pkgname}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('a2762060135bfed6869572bccc1429d7')

build() {
  cd "${pkgname}-${pkgver}"
  # fix `arch` command for i386/x86_64 architecture
  sed -i 's/ARCHITECTURE =.*/ARCHITECTURE = $(shell uname -m)/' Makefile
  # Define USE_ANSI if you want some colorized texts, using ANSI CSI escape codes.
  USE_ANSI=1 make sbindir=/usr/bin
}

package() {
  cd "${pkgname}-${pkgver}"
  install -p -Dm 755 "bin/t50" "$pkgdir/usr/bin/t50"
  mkdir -p "$pkgdir/usr/share/man/man8"
  gzip -c -9 "doc/t50.8" > "$pkgdir/usr/share/man/man8/t50.8.gz"
}

# vim:set et sw=2 sts=2 tw=80:

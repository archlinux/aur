# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgbase=unix-tree-pt-br
pkgname=('unix-tree-pt-br')
pkgver=2.3.2
pkgrel=1
pkgdesc="A directory listing program displaying a depth indented list of files"
arch=('x86_64')
url="https://gitlab.com/OldManProgrammer/unix-tree"
license=('GPL-2.0-or-later')
depends=('glibc')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/johnpetersa19/unix-tree-master-Multilingual/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('019b07fac1b4e171d6e00bef986cfc391aece8918637f9da81cdcc6c1b03f37a0680f6955332bef3651b66fae17fb5f69083c792a469682e522d697a161ff9af')

prepare() {
  cd "unix-tree-master-Multilingual-${pkgver}"
  sed -i -e '/^CFLAGS/d' -e '/^LDFLAGS/d' -e '/-Wdiscarded-qualifiers/d' Makefile
}

build() {
  cd "unix-tree-master-Multilingual-${pkgver}"
  make
}

package() {
  cd "unix-tree-master-Multilingual-${pkgver}"
  make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
}

# Maintainer: libele <libele@disroot.org>
# Contributor:  Beej <beej@beej.us>
# Contributor:  Michiel Broek <mbse at mbse eu>

pkgname=cpmtools
pkgver=2.23
pkgrel=1
pkgdesc="Tools to access CP/M disks"
arch=('i686' 'x86_64')
url="http://www.moria.de/~michael/cpmtools/"
license=('GPL')
depends=(ncurses)
source=("http://www.moria.de/~michael/cpmtools/files/${pkgname}-${pkgver}.tar.gz"
	'ecsys.drives'
	'prodos.drives'
	'z80pack.drives')
sha256sums=('7839b19ac15ba554e1a1fc1dbe898f62cf2fd4db3dcdc126515facc6b929746f'
            '42fbaa5d733d4da255f6e3f9cb8e844f8dae6cd9858c9aa364213e34f45934d9'
            '10899a2dd2a46e34e278c3aa07d4d65c66c7d885d0d8df8c1c255c2af06d3c8e'
            '5969c802ba8d6cdeadb96190b15a6e58ba365fdcf42723581a350f54ea221c8d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure  --prefix=/usr || exit 1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/man/man1
  mkdir -p "${pkgdir}"/usr/share/man/man5
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"

  make BINDIR="${pkgdir}"/usr/bin MANDIR="${pkgdir}"/usr/share/man prefix="${pkgdir}"/usr install
  cat "${srcdir}"/*.drives >> "${pkgdir}"/usr/share/diskdefs

  cp -a COPYING INSTALL NEWS README* "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"
  chmod 644 "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"/*
}


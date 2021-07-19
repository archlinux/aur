# maintainer: libele <libele@disroot.org>

# contributor:  Beej <beej@beej.us>
# contributor:  Michiel Broek <mbse at mbse eu>

pkgname=cpmtools
pkgver=2.22
pkgrel=2
pkgdesc="Tools to access CP/M disks"
arch=('i686' 'x86_64')
url="http://www.moria.de/~michael/cpmtools/"
license=('GPL')
depends=(ncurses)
source=("http://www.moria.de/~michael/cpmtools/files/${pkgname}-${pkgver}.tar.gz"
	'ecsys.drives'
	'prodos.drives'
	'z80pack.drives')
md5sums=('efe8ead733e412b16436fd43910fb61d'
         'c54b18fbafcb867a014cc814ed2eb93e'
	 'fc7152d7ae35e690b0860ead7997a03c'
         '2eef83b5fbc21870743a6eb871fff4b5')

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


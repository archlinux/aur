# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>

pkgname=pcb2gcode
pkgver=1.2.2
pkgrel=1
pkgdesc="Gerber to gcode file converter" 
arch=('i686' 'x86_64')
url="https://github.com/pcb2gcode/pcb2gcode/wiki"
license=('GPL')
depends=('gerbv-git')
source=("https://github.com/pcb2gcode/pcb2gcode/releases/download/v${pkgver}/pcb2gcode-${pkgver}.tar.gz"
        '0001-Fixed-GCC5-build-errors.patch'
        'glibmm.patch')
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i ../0001-Fixed-GCC5-build-errors.patch
  patch -p1 -i ../glibmm.patch
  autoreconf -i
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

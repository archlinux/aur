# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=electricfence
pkgver=2.2.2
pkgrel=3
pkgdesc="Debugging malloc() that uses the VM hardware to detect buffer overruns"
arch=('i686' 'x86_64')
url="http://perens.com/FreeSoftware/ElectricFence/"
license=('GPL2')
source=("http://dl.packetstormsecurity.net/programming-tutorials/ElectricFence-${pkgver}.tar.gz"
        "ef.sh.patch"
        "efence.c.patch"
        "eftest.c.patch"
        "page.c.patch"
        "print.c.patch")
md5sums=('56a3cbfdbf65f916988787c789c63e80'
         '3d5905c3cc9c52f09b6a387520a0d86c'
         '67023a6cdcae4058e698089b041d00a8'
         '3aad193fdc0b282d5d5fb05bb06ba4f9'
         '4b5292775e9588b21ccf867f0160a34d'
         '5026c7863d3b980ff093cb2d22c2d303')

build() {
  cd "${srcdir}/ElectricFence-${pkgver}"
  patch -Np0 -i "$startdir/src/ef.sh.patch"
  patch -Np0 -i "$startdir/src/efence.c.patch"
  patch -Np0 -i "$startdir/src/eftest.c.patch"
  patch -Np0 -i "$startdir/src/page.c.patch"
  patch -Np0 -i "$startdir/src/print.c.patch"
  make
}

package() {
  cd "${srcdir}/ElectricFence-${pkgver}"
  install -d -m 755 "${pkgdir}/usr/bin"
  install -d -m 755 "${pkgdir}/usr/lib"
  install -d -m 755 "${pkgdir}/usr/man/man3"
  make install prefix="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:

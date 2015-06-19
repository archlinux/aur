# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=xmbmon
pkgver=2.05
pkgrel=4
pkgdesc="X Motherboard Monitor"
arch=('i686' 'x86_64')
url="http://www.nt.phys.kyushu-u.ac.jp/shimizu/download/download.html"
license=('GPL')
depends=('libxt')
source=("http://www.nt.phys.kyushu-u.ac.jp/shimizu/download/xmbmon/xmbmon205.tar.gz"
        "Makefile.in.patch"
        "font.patch")
md5sums=('ab6614c785f5b653fcc69fb9c02058f0'
         '3f0659309f48935ce511d9ff87e76d65'
         '19d78a98841fe1c3705ea788e422592f')

build() {
  cd "${srcdir}/${pkgname}${pkgver//\./}"
  patch -Np1 -i "${srcdir}/Makefile.in.patch"
  patch -Np0 -i "${srcdir}/font.patch"
  ./configure --build=i686-pc-linux-gnu
  make
}

package() {
  cd "${srcdir}/${pkgname}${pkgver//\./}"
  install -d -m755 "${pkgdir}/usr"/{bin,share/man/man1}
  make DESTDIR="${pkgdir}" install install-man
}

# vim:set ts=2 sw=2 et:

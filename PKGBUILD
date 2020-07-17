# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
_target=aarch64-linux-gnu

_pkgname=xorg-util-macros
pkgname=$_target-$_pkgname
pkgver=1.19.2
pkgrel=2
pkgdesc="X.Org Autotools macros"
arch=(any)
license=('custom')
url="https://xorg.freedesktop.org/"
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.bz2{,.sig})
sha512sums=('3f51504b27f0478c136126f15110cf3cdbba218c4d74a8e974cca1381c6e8364609bd0c444f2fb19aa86a7f4e848dfce4f4da940463b224036f75a60b3d88619'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A')
validpgpkeys+=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
  cd util-macros-${pkgver}
  ./configure --build $_target --prefix=/usr/$_target
  make
}

package() {
  cd util-macros-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/$_target/lib"
  mv "${pkgdir}/usr/$_target/share/pkgconfig" "${pkgdir}/usr/$_target/lib/"
  install -m755 -d "${pkgdir}/usr/$_target/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/$_target/share/licenses/${pkgname}/"
}

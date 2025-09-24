# Maintainer: Voxan24 <admin@hessfr.fr>
_target=aarch64-linux-gnu

_pkgname=xorg-util-macros
pkgname=$_target-$_pkgname
pkgver=1.20.2
pkgrel=2
pkgdesc="X.Org Autotools macros"
arch=(any)
license=('custom')
url="https://xorg.freedesktop.org/"
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.bz2{,.sig})
b2sums=('e1e0b78248ecf889aa8d0bad2e98ad26377ab7d559b4b7f82a63be53052b615983220ce6fac18c44ee26d550a650795672d0b0a4d545cf77174bfeb7d7314c83'
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

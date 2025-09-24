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
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.gz{,.sig})
b2sums=('57c880e87b7714234d220897736864401277a609a2038a018b551f495868c6ac9ef3257a8df367369635a304440386877f287dd7d27e42616def00ec1dc1b55e'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A')
validpgpkeys+=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

prepare(){
  gpg --recv-keys CFDF148828C642A7
}
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

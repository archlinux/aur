# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=opensplice-dds
pkgver=6.4.140407OSS
pkgrel=1
pkgdesc="Enables seamless, timely, scalable and dependable data sharing between distributed applications and network connected devices."
arch=('i686' 'x86_64')
url="http://www.prismtech.com/opensplice"
license=('GPL')
depends=('java-environment' 'zlib')
source=(http://dev.opensplice.org/releases/downloads/releases/OpenSpliceDDSV${pkgver}-src.tar.gz)
md5sums=('a25a7f4b21934de86fea2e6f8cddd159')
sha256sums=('204310232fa2ce277e5d1f92bde976e22efe65ae8b08d278a02429a13065e7b9')
sha384sums=('e623cefbf66f2e671159a2791b52e6a52b1e169edbc10d6a896ae5c34523508dd5a7367a33130c6ed1ee44b5e5c86628')
sha512sums=('0b3e51598fde1badd853958c8960912ed8fd3cef1534a4757cee3dbe49454964e08896be4831b61e90b01a3c3e7802afba775dc8322f628b22170ca27787d672')
options=(!makeflags)


if [ "$CARCH" == "i686" ]; then
  _arch=x86.linux
else
  _arch=x86_64.linux
fi


build() {
  cd "${srcdir}/OpenSpliceDDS6.4"

  source configure ${_arch}-release

  make

  cd install
  make
}

package() {
  cd "${srcdir}/OpenSpliceDDS6.4/install/HDE/${_arch}"

  install -dm755 "${pkgdir}/usr/bin"
  cp -a bin/* "${pkgdir}/usr/bin/"

  install -dm755 "${pkgdir}/usr/lib"
  install -Dm644 lib/* "${pkgdir}/usr/lib/"

  install -dm755 "${pkgdir}/usr/include"
  cp -a include/* "${pkgdir}/usr/include/"

  install -dm755 "${pkgdir}/usr/share/opensplice"
  cp -a etc "${pkgdir}/usr/share/opensplice/"
  cp -a docs "${pkgdir}/usr/share/opensplice/"
  cp -a demos "${pkgdir}/usr/share/opensplice/"
  cp -a examples "${pkgdir}/usr/share/opensplice/"
  cp -a jar "${pkgdir}/usr/share/opensplice/"
  cp -a src "${pkgdir}/usr/share/opensplice/"
}


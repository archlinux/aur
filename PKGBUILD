# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=opensplice-dds
pkgver=6.7.171127
_filename=OSPL_V${pkgver//./_}OSS_RELEASE
pkgrel=1
pkgdesc="Enables seamless, timely, scalable and dependable data sharing between distributed applications and network connected devices."
arch=('i686' 'x86_64')
url="http://www.prismtech.com/dds-community"
license=('GPL')
depends=('gsoap')
optdepends=('java-environment: java interfacing'
            'doxygen: generate documentation'
            'protobuf: generate protocol buffer messages')
source=(https://github.com/ADLINK-IST/opensplice/archive/${_filename}.tar.gz)
sha512sums=('348d9f221a5cf39d0a82486f0be999379d93a21aba0734f9889e4dd90cdb6de9eb734fe7c5b070258f49b3ffe450c0e3ccf2a6546141eff42828efc58c39d995')
options=(!makeflags)


if [ "$CARCH" == "i686" ]; then
  _arch=x86.linux
else
  _arch=x86_64.linux
fi


build() {
  cd "${srcdir}/opensplice-${_filename}"

  source configure ${_arch}-release

  make

  cd install
  make
}

package() {
  cd "${srcdir}/opensplice-${_filename}/install/HDE/${_arch}"

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


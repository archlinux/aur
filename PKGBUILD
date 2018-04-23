# Old Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>

pkgname=opensplice-dds
pkgver=6_7_180404
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
sha256sums=('320e678d26cd0b29b8d2240093ef8d7b48f491b7c3fb5466af18660d8cbc2cfd')
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


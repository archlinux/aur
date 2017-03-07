
# Maintainer: Florian Hofmann <fho@f12n.de>

# Special thanks to Gadget3000

pkgname=instantreality
pkgver=2.8.0
_pkgsubver=38619
pkgrel=1
pkgdesc="The framework provides a comprehensive set of features to support classic Virtual Reality (VR) and advanced Augmented Reality (AR) equally well."
arch=('x86_64')
url="http://www.instantreality.org"
license=('custom:Fraunhofer-Gesellschaft')
depends=(freealut libpng12 graphicsmagick gtkglext libgnomeui ffmpeg python
nvidia-cg-toolkit java-environment ffmpeg-compat qtwebkit freeglut bluez-libs
libgcrypt15)
makedepends=(binutils)

md5sums=('b7fbbbc984040b304bc869e969c39bbf'
         '7be414f4260e6a35a66c08b3c3f7f216'
         '9bba3d3ebd0c14e0de3fa77fd0cf52dc'
         '1609491ab90cf5ea5075451339184392'
         '423856f1fa176ceebbd980793e3d26c2'
         '23f0d7731566377c56ca7b086c92963a'
         '6b61bd2a756980f9056ed00a3b592b02'
         '77b7bb98814b9e94fd526cd4866450d9'
         '5f9bd6ce56d9527c7ffd8a32ecdcad74'
         '4a38db1db137cf1c6ec4a596af9ffa36'
         'b7868e85d6510e6a9634e3d1cb66f168'
         '8be949a9bb46ade19b29e72ff4329a0a'
         'ab2c5391bc86f0028d178780643c021c'
         '8f08f96b1b80139906f282b507c2a9ff'
         'a19948dc9d5247ffb7d9a418ae804801')

_iarch=x64
_uarch=amd64

source=("http://doc.instantreality.org/media/uploads/downloads/${pkgver}/InstantReality-Ubuntu-14.04-${_iarch}-${pkgver}.${_pkgsubver}.deb"

        "http://de.archive.ubuntu.com/ubuntu/pool/main/o/openexr/libopenexr6_1.6.1-7ubuntu1_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/i/ilmbase/libilmbase6_1.0.1-6ubuntu1_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff5_4.0.3-7ubuntu0.6_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/b/boost1.54/libboost-system1.54.0_1.54.0-4ubuntu3_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/b/boost1.54/libboost-filesystem1.54.0_1.54.0-4ubuntu3_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/b/boost1.54/libboost-regex1.54.0_1.54.0-4ubuntu3_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/b/boost1.54/libboost-thread1.54.0_1.54.0-4ubuntu3_${_uarch}.deb"

        "http://de.archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-3_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/universe/liba/libav/libavcodec54_9.20-0ubuntu0.14.04.1_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/universe/liba/libav/libavutil54_11.2-1_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/j/jbigkit/libjbig0_2.0-2ubuntu4.1_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/universe/o/openjpeg/libopenjpeg2_1.3+dfsg-4.7ubuntu1_${_uarch}.deb"

        "http://mirrors.kernel.org/ubuntu/pool/main/r/rtmpdump/librtmp0_2.4+20121230.gitdf6c518-1_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/g/gnutls26/libgnutls26_2.12.23-12ubuntu2.6_${_uarch}.deb"

)

# don't extract anything ... we will do it by hand
noextract=(${source[@]##*/})



build() {


  cd ${srcdir}

  # unpack ubuntu libraries

  for f in *.deb; do
    undeb xxx "$f"
  done

}

function undeb {
  echo "----- undebbing: $2 -----"
  install -d "${srcdir}/$1"
  ar x "$2"
  tar -xaf data.tar.* -C "${srcdir}/$1"
  rm ${srcdir}/control.* ${srcdir}/data.tar.* ${srcdir}/debian-binary
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make -k check
#}

package() {
  cd "$srcdir"

  # install instant reality
  ar x InstantReality-Ubuntu-14.04-${_iarch}-${pkgver}.${_pkgsubver}.deb
  tar -xaf data.tar.xz -C ${pkgdir}



  # install ubuntu libs
  IRLIBS="${pkgdir}/opt/instantReality/lib/"
  install -d $IRLIBS

  for f in ${srcdir}/*/usr/lib/${CARCH}-linux-gnu/*; do
    install -D -m644 "$f" $IRLIBS
  done

}

# vim:set ts=2 sw=2 et:

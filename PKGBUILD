
# Maintainer: Florian Hofmann <fho@f12n.de>

# Special thanks to Gadget3000

pkgname=instantreality
pkgver=2.5.1
_pkgsubver=28546
pkgrel=1
pkgdesc="The framework provides a comprehensive set of features to support classic Virtual Reality (VR) and advanced Augmented Reality (AR) equally well."
arch=('x86_64')
url="http://www.instantreality.org"
license=('custom:Fraunhofer-Gesellschaft')
depends=(freealut libpng12 graphicsmagick gtkglext libgnomeui ffmpeg python
nvidia-cg-toolkit java-environment ffmpeg-compat qtwebkit freeglut bluez-libs
libgcrypt15)
makedepends=(binutils)

md5sums=('f51e92748513b89dc7665f98e90d1aa0'
         '7be414f4260e6a35a66c08b3c3f7f216'
         '9bba3d3ebd0c14e0de3fa77fd0cf52dc'
         '7a5958d7bea247a996fcf74c4282c309'
         '423856f1fa176ceebbd980793e3d26c2'
         '23f0d7731566377c56ca7b086c92963a'
         '6b61bd2a756980f9056ed00a3b592b02'
         '77b7bb98814b9e94fd526cd4866450d9'
         '5f9bd6ce56d9527c7ffd8a32ecdcad74'
         'fe2ec0f5e915195f639d34e3457ab132'
         '4cacccb33a289abe4d822487aa70a78e'
         'e3abf92182f88a8ffb2acc36b33c14dd'
         '8be949a9bb46ade19b29e72ff4329a0a'
         'ab2c5391bc86f0028d178780643c021c'
         '8f08f96b1b80139906f282b507c2a9ff'
         '5cb53fc1d8fc987061c0f722631dc902')



_iarch=x64
_uarch=amd64

source=("http://doc.instantreality.org/media/uploads/downloads/${pkgver}/InstantReality-Ubuntu-14.04-${_iarch}-${pkgver}.${_pkgsubver}.deb"

        "http://de.archive.ubuntu.com/ubuntu/pool/main/o/openexr/libopenexr6_1.6.1-7ubuntu1_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/i/ilmbase/libilmbase6_1.0.1-6ubuntu1_${_uarch}.deb"
        "http://security.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff5_4.0.3-7ubuntu0.3_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/b/boost1.54/libboost-system1.54.0_1.54.0-4ubuntu3_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/b/boost1.54/libboost-filesystem1.54.0_1.54.0-4ubuntu3_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/b/boost1.54/libboost-regex1.54.0_1.54.0-4ubuntu3_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/main/b/boost1.54/libboost-thread1.54.0_1.54.0-4ubuntu3_${_uarch}.deb"

        "http://de.archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-3_${_uarch}.deb"

        "http://security.ubuntu.com/ubuntu/pool/universe/liba/libav/libavcodec54_9.18-0ubuntu0.14.04.1_${_uarch}.deb"
        "http://security.ubuntu.com/ubuntu/pool/universe/liba/libav/libavformat54_9.18-0ubuntu0.14.04.1_${_uarch}.deb"
        "http://security.ubuntu.com/ubuntu/pool/universe/liba/libav/libavutil52_9.18-0ubuntu0.14.04.1_${_uarch}.deb"
        "http://security.ubuntu.com/ubuntu/pool/main/j/jbigkit/libjbig0_2.0-2ubuntu4.1_${_uarch}.deb"
        "http://de.archive.ubuntu.com/ubuntu/pool/universe/o/openjpeg/libopenjpeg2_1.3+dfsg-4.7ubuntu1_${_uarch}.deb"

        "http://mirrors.kernel.org/ubuntu/pool/main/r/rtmpdump/librtmp0_2.4+20121230.gitdf6c518-1_${_uarch}.deb"
        "http://security.ubuntu.com/ubuntu/pool/main/g/gnutls26/libgnutls26_2.12.23-12ubuntu2.2_${_uarch}.deb"

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
  echo "----- undebbing: $1 -----"
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

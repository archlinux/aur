# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=papilio-designlab
pkgver=1.0.6
pkgrel=1
pkgdesc="It is an IDE specially designed to get you up and running quickly with Soft Processors on the Papilio FPGA boards"
arch=('x86_64' 'i686')
url="http://forum.gadgetfactory.net/index.php?/files/file/236-papilio-designlab-ide/"
license=('GPL')
groups=()
options=(!strip staticlibs !upx)
PKGEXT='.pkg.tar'
depends=('java-runtime')
_bits=32
[ $CARCH = x86_64 ] && _bits=64
source=("DesignLab-${pkgver}-linux${_bits}.tgz::http://www.gadgetfactory.net/download/DesignLab/DesignLab-${pkgver}-linux${_bits}.tgz" 'designlab' 'designlab.desktop' 'designlab.png')
install=papilio-designlab.install
[ $CARCH = i686 ] && md5sums=('32a4cc1727b4c9427df083b9c14b144d')
[ $CARCH = x86_64 ] && md5sums=('ffa2123710a2a6e55865e513e23e6b8c')
md5sums+=('95b470f30b17b790c95f983f20fc71f1'
         'a4d2f7a5a0508106664d158e51f7e034'
         '7e27108f30b6a253abf907f0b96c56b3')


build() {
  echo "Nothing to build..."
}

package() {
  cd "$srcdir/DesignLab-${pkgver}"
  mkdir -p $pkgdir/usr/share/papilio-designlab
  msg "Copying files"
  cp -ax * $pkgdir/usr/share/papilio-designlab
  msg "Correcting file permissions"
  find $pkgdir/usr/share/papilio-designlab/hardware/tools -type d -print0|xargs -0 chmod 755
  find $pkgdir/usr/share/papilio-designlab/hardware/tools/zpu/bin -type f -print0|xargs -0 chmod 755
#  if test "$CARCH" == x86_64; then
#      echo "64-bit serial library is used..."
#      cp -ax ./lib/librxtxSerial64.so $pkgdir/usr/share/papilio-designlab-ide/lib/librxtxSerial.so
#  fi
  cd "$srcdir"
  install -D -m755 designlab "${pkgdir}/usr/bin/designlab"
  install -D -m644 designlab.desktop "${pkgdir}/usr/share/applications/designlab.desktop"
  install -D -m644 designlab.png "${pkgdir}/usr/share/pixmaps/designlab.png"
}

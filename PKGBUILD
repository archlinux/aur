# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=papilio-designlab
pkgver=1.0.8
pkgrel=3
pkgdesc="It is an IDE specially designed to get you up and running quickly with Soft Processors on the Papilio FPGA boards"
arch=('x86_64' 'i686')
url="http://forum.gadgetfactory.net/index.php?/files/file/236-papilio-designlab-ide/"
license=('custom')
groups=()
options=(!strip staticlibs)
PKGEXT='.pkg.tar'
depends=('java-runtime=8')
source_i686=("DesignLab-${pkgver}-linux32.tgz::http://www.gadgetfactory.net/download/DesignLab/DesignLab-${pkgver}-linux32.tgz")
source_x86_64=("DesignLab-${pkgver}-linux64.tgz::http://www.gadgetfactory.net/download/DesignLab/DesignLab-${pkgver}-linux64.tgz")
source=('designlab' 
        'designlab.desktop' 
        'designlab.png' 
        'LICENSE')
install=papilio-designlab.install
md5sums_i686=('abf1d56ca2957e459455fb861ab3d9d6')
md5sums_x86_64=('08bf01f7366c5cb85b8f03ef93696cab')
md5sums+=('95b470f30b17b790c95f983f20fc71f1'
         'a4d2f7a5a0508106664d158e51f7e034'
         '7e27108f30b6a253abf907f0b96c56b3'
         '65c2c2b9df1c372efddfadaa49b76a89')


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
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

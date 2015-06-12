#Maintainer:xgdgsc

pkgname="tunet"
pkgver="1"
pkgrel=1
pkgdesc="Tsinghua University network authentication client for Linux."
arch=("i686" "x86_64")
url="http://net.tsinghua.edu.cn"
license=('Unknown')
source=("http://net.tsinghua.edu.cn/files/TUNet_linux.tar.gz" "TUNet.desktop")
md5sums=("da737c2edd551cc259378eef3dff343b" "55d1a040bc394e096fa4c81f43444458")
depends=('glib2')

package() {
  cd "${srcdir}/TUNet_linux/"
  mkdir -p "${pkgdir}/opt/TUNet"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cp *.png "${pkgdir}/opt/TUNet"
  cp tunet.ui "${pkgdir}/opt/TUNet"
  if [[ $CARCH = i686 ]];then
    cp TUNet "${pkgdir}/opt/TUNet"
    sed -i 's|Exec=/opt/TUNet/TUNet64|Exec=/opt/TUNet/TUNet|' "${srcdir}/TUNet.desktop"
    cp "${srcdir}/TUNet.desktop" "${pkgdir}/usr/share/applications/"
  else
    cp TUNet64 "${pkgdir}/opt/TUNet"
    cp "${srcdir}/TUNet.desktop" "${pkgdir}/usr/share/applications/"
  fi
}
# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=minimserver
pkgver=0.8.3
pkgrel=7
pkgdesc="UPnP Audio Server"
arch=('x86_64')
url="http://www.minimserver.com"
license=('custom:minimserver')
depends=('jre8-openjdk' 'bash')
install=${pkgname}.install
source=("http://minimserver.com/download1/MinimServer-${pkgver}-x64.apk" "minimserver@.service" "http://tophifi.it/ftp/packages/minimserver_bin.tar.gz")
sha256sums=('4c9ee6cec6a5b57002528677e7850a0e770b9fcb1e887a906f09a9eaeb12494e' '1242041a76ce3296a426602c3ab7944ba810eb7152370cc54620b51e2e2813f8'
'11568572b615fc096da58792af8e95e736b2d07b36913aa659184ed755b9a890')

package() {
  cd ${srcdir}
  
  mkdir -p ${pkgdir}/opt/minimserver/icons
  bsdtar xf data.tar.gz -C "${pkgdir}/opt/minimserver"
  rm -rf ${pkgdir}/opt/minimserver/libext
  rm -rf ${pkgdir}/opt/minimserver/libsys
  rm ${pkgdir}/opt/minimserver/bin/startd
  rm ${pkgdir}/opt/minimserver/bin/stopall
  install -Dm755 ${srcdir}/bin_modified/startd ${pkgdir}/opt/minimserver/bin/startd
  install -Dm755 ${srcdir}/bin_modified/stopall ${pkgdir}/opt/minimserver/bin/stopall
  install -Dm644 ${srcdir}/bin_modified/server48.png ${pkgdir}/opt/minimserver/icons/server48.png
  install -Dm644 ${srcdir}/bin_modified/MinimServer.desktop ${pkgdir}/opt/minimserver/icons/MinimServer.desktop
  install -Dm644 "minimserver@.service" \
  "$pkgdir/usr/lib/systemd/system/minimserver@.service"
}

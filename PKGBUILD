# Maintainer: Peter Klotz <peter.klotz99@gmail.com>
pkgname=uex
pkgver=16.1.0.22
pkgrel=1
pkgdesc="UltraEdit is a powerful text editor."
arch=('i686' 'x86_64')
url="http://www.ultraedit.com/products/uex.html"
license=('custom')
depends=('desktop-file-utils' 'gtk2' 'libjpeg6' 'libpng12' 'libsm')
install=uex.install
if [ "${CARCH}" = 'i686' ]; then
  source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_i386.tar.gz)
  md5sums=('573b59c11cb56331490f69cd2e86ffeb')
else
  source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_amd64.tar.gz)
  md5sums=('4b522dd2c53164dd97872ebcc94e5cc0')
fi
DLAGENTS=('https::/usr/bin/curl -fLC - --user-agent Lynx --retry 3 --retry-delay 3 -o %o %u')

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -R "${srcdir}/uex" "${pkgdir}/opt"
  ln -s "/opt/uex/bin/uex" "${pkgdir}/usr/bin/uex"
  ln -s "/opt/uex/share/uex/ue.png" "${pkgdir}/usr/share/pixmaps/ue.png"
  ln -s "/opt/uex/share/uex/uex.desktop" "${pkgdir}/usr/share/applications/uex.desktop"
  ln -s "/opt/uex/share/doc/uex/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

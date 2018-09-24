# Maintainer: Peter Klotz <peter.klotz99@gmail.com>
pkgname=uex
pkgver=18.00.0.40
pkgrel=1
pkgdesc="UltraEdit is a powerful text editor."
arch=('i686' 'x86_64')
url="http://www.ultraedit.com/products/uex.html"
license=('custom')
depends=('desktop-file-utils' 'webkit2gtk' 'libjpeg' 'libpng' 'libsm')
if [ "${CARCH}" = 'i686' ]; then
  source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_i386.tar.gz)
  sha256sums=('1efd75b42a368d0e4f57c9705c31336c973a5619581a1fc10fba9d40a55aa607')
else
  source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_amd64.tar.gz)
  sha256sums=('f8287a9bff7d218e74c72bdb237358655a1c2981fa2a64e088e476e7b17fd635')
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

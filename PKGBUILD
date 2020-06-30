# Maintainer: Peter Klotz <peter.klotz99@gmail.com>
pkgname=uex
pkgver=20.00.0.34
pkgrel=1
pkgdesc="UltraEdit is a powerful text editor."
arch=('i686' 'x86_64')
url="http://www.ultraedit.com/products/uex.html"
license=('custom')
depends=('desktop-file-utils' 'webkit2gtk' 'libjpeg' 'libpng' 'libsm')
if [ "${CARCH}" = 'i686' ]; then
  source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_i386.tar.gz)
  sha256sums=('ffd23b9c6aa2f6b21cbfb0fee8c2d81f59bcbc13e33ae3026d8c4bf8d41cdbb4')
else
  source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_amd64.tar.gz)
  sha256sums=('40a3b529aa1f0e3256d6e0f4775b77a5895c9e634bd0c2b6295a7279bf8653ee')
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

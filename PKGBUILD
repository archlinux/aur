# Maintainer: Peter Klotz <peter.klotz99@gmail.com>
pkgname=uex
pkgver=18.00.0.30
pkgrel=1
pkgdesc="UltraEdit is a powerful text editor."
arch=('i686' 'x86_64')
url="http://www.ultraedit.com/products/uex.html"
license=('custom')
depends=('desktop-file-utils' 'webkit2gtk' 'libjpeg' 'libpng' 'libsm')
if [ "${CARCH}" = 'i686' ]; then
  source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_i386.tar.gz)
  sha256sums=('bf563a572f9dc67a5bffadcd8ca13052c038243cefc48e9b3f5035834e09e5c4')
else
  source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_amd64.tar.gz)
  sha256sums=('c999aeaaa66402e873bcb8c3cb5f8ed6dae38f37a18c6d54775119893edbe5b0')
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

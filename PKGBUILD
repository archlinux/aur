# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=electronwmd-appimage
pkgver=1.4.2
_fullpkgver=0.3.2-$pkgver
pkgrel=3
pkgdesc='Upload music to NetMD MiniDisc devices'
arch=('x86_64')
url='https://web.minidisc.wiki/'
license=('GPL2')
depends=()
provides=('web-minidisc-pro' 'electronwmd')
conflicts=('web-minidisc-pro' 'electronwmd')
options=('!strip')
noextract=("electronwmd-${_fullpkgver}.AppImage")
source=("electronwmd-${_fullpkgver}.AppImage::https://github.com/asivery/ElectronWMD/releases/download/v${_fullpkgver}/electronwmd-${_fullpkgver}-linux_x86_64.AppImage"
        "electronwmd.desktop.patch"
        "electronwmd.sh")
sha256sums=('b6d363300fe26ed51641c8812bf0b6d25d8854955316c0a46b0f1756de3e6968'
            '67f9612250ea09c0760bf31b83cfb6dd97de21c14aa047ad3092d66b222977fd'
            '17538d248d36555d08227cf28c0e3436d92c0ed00f317dd9a1833a3cc847a530')

prepare() {
  cd "${srcdir}"
  chmod +x electronwmd-${_fullpkgver}.AppImage
  ./electronwmd-${_fullpkgver}.AppImage --appimage-extract electronwmd.desktop
  ./electronwmd-${_fullpkgver}.AppImage --appimage-extract usr/share/icons
  patch -Np0 < electronwmd.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/electronwmd-${_fullpkgver}.AppImage" "${pkgdir}/opt/appimages/electronwmd.AppImage"
  install -Dm755 "${srcdir}/electronwmd.sh" "${pkgdir}/usr/bin/electronwmd"
  install -Dm644 "${srcdir}/squashfs-root/electronwmd.desktop" "${pkgdir}/usr/share/applications/electronwmd.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/electronwmd.png" "${pkgdir}/usr/share/pixmaps/electronwmd.png"
}

# Maintainer: Funami
pkgname=rpi-imager-bin
pkgver=1.9.0
pkgrel=3
pkgdesc="Raspberry Pi Imaging Utility"
arch=('x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=('Apache-2.0')
depends=('qt6-base' 'qt6-declarative' 'qt6-tools' 'qt6-svg' 'hicolor-icon-theme' 'gnutls' 'libcurl-gnutls' 'libarchive' 'dosfstools' 'util-linux')
optdepends=('udisks2: non-root user support')
provides=('rpi-imager')
conflicts=('rpi-imager')
_filename="Raspberry_Pi_Imager-${pkgver}-${arch}.AppImage"
source=("https://github.com/raspberrypi/rpi-imager/releases/download/v$pkgver/${_filename}"
    "https://github.com/raspberrypi/rpi-imager/raw/qml/doc/man/rpi-imager.1"
    "https://github.com/raspberrypi/rpi-imager/raw/qml/debian/changelog")
sha256sums=('26e837a758776d8a6cec7b92262d73188bcecee20c48cff066d05adef2dc555f'
            '69bc1528af1d369795d7a6fa1726084ffe62b47b19378de4fdf9022c91760e99'
            'c2f70b370a6bbe535811ddcec1f3bcdb183c461a8b5c1f0d0ce250f98c17e9ba')

prepare() {
  chmod +x "${_filename}"
  ./${_filename} --appimage-extract > /dev/null
}

package() {
  cd squashfs-root

  install -Dm755 usr/bin/rpi-imager "${pkgdir}/usr/bin/rpi-imager"
  install -Dm644 usr/share/applications/org.raspberrypi.rpi-imager.desktop "${pkgdir}/usr/share/applications/org.raspberrypi.rpi-imager.desktop"
  install -Dm644 usr/share/icons/hicolor/128x128/apps/rpi-imager.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/rpi-imager.png"
  install -Dm644 usr/share/metainfo/rpi-imager.metainfo.xml "${pkgdir}/usr/share/metainfo/rpi-imager.metainfo.xml"
  install -Dm644 ../rpi-imager.1 "${pkgdir}/usr/share/man/man1/rpi-imager.1"
  install -Dm644 ../changelog "${pkgdir}/usr/share/doc/rpi-imager/changelog"
}

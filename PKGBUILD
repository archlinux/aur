# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>

pkgname=odio-appimage
pkgver=1.4.0
pkgrel=1
pkgdesc="A free radio streaming software with more than 20,000 radio stations from around the world"
arch=('x86_64')
url='https://odio.io/'
license=('custom')
provides=('odio')
conflicts=('odio')
source=("https://github.com/odioapp/odio/releases/download/v${pkgver}/odio-${pkgver}-${arch}.AppImage"
        odio.desktop.patch
        odio.sh)
sha256sums=(SKIP
         '90369800ea2f88f3d4c7304125c850efba630c0e7b97a68e50d84eb34421a25f'
         'c68a609cb0c1eb91bec7dc6d38edc00bcf972b089f5440278f297be317ee23a4')
options=(!strip)
_filename=./odio-${pkgver}-${arch}.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  #patch -Np0 < ./odio.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/odio.AppImage"
  install -Dm755 "${srcdir}/odio.sh" "${pkgdir}/usr/bin/odio"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/odio.desktop" "${pkgdir}/usr/share/applications/odio.desktop"
}
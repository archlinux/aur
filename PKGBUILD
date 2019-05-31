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
         '2e393dc46cf88f98f91d19d5fe2487c185294e5b6004271064daf71c67e3eaaf'
         '2565997eae175069af50e1eb6dafdb87cc17cb78f14da65dfd724815d522c0f7')
options=(!strip)
_filename=./odio-${pkgver}-${arch}.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/odio.AppImage"
  install -Dm755 "${srcdir}/odio.sh" "${pkgdir}/usr/bin/odio"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/odio.desktop.patch" "${pkgdir}/usr/share/applications/odio.desktop"
}
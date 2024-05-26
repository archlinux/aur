# Maintainer: Jens Nachtigall <aur.jens@nachtigall.email>

pkgname=hoerbert-appimage
pkgver=3.1.3
pkgrel=1
pkgdesc="Desktop application to manage audio files on the Hoerbert childrens music player (AppImage version)"
arch=('x86_64')
url='https://en.hoerbert.com/'
license=('GPL3')
provides=("hoerbert-appimage=${pkgver}")
source=("https://en.hoerbert.com/downloads/3.1.3/hoerbert-${pkgver}-${arch}.AppImage"
        'hoerbert.sh')
sha256sums=('c8cac37e3c39b2e8d8a1a74856af931044b7ab334038d19dd875a10fcbe32eb2'
            '147e441743c73e9fed89b175cfb1a8f47ebaa91c59945b6e7a773f31531035b3')
options=(!strip !debug)
_image="$(basename "${source[0]}")"

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/appimages/hoerbert.AppImage"
  install -Dm755 "${srcdir}/hoerbert.sh" "${pkgdir}/usr/bin/hoerbert"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/hoerbert.png" "${pkgdir}/usr/share/pixmaps/hoerbert.png"
  install -Dm644 "${srcdir}/squashfs-root/hoerbert.desktop" "${pkgdir}/usr/share/applications/hoerbert.desktop"
}

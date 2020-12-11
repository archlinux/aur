# Maintainer: Yjun <jerrysteve@gmail.com>

pkgname=moonfm-appimage
_pkgname=moonfm
pkgver=2.0.9
pkgrel=1
pkgdesc="An easy to use podcast player for podcast lovers, discover the best of over 600,000+ podcasts.(AppImage version)"
arch=('x86_64')
url='https://moon.fm/'
license=('unknown')
provides=("moonfm")
conflicts=('moonfm')
depends=('zlib')
source=("https://moon.fm/dist/MoonFM-${pkgver}-${arch}.AppImage"
        "${_pkgname}.sh")
sha256sums=('76b2b52095a9598d403fa04076636c28a8ab70ac70526e62d1944cc8c393f2ff'
            'f416432624a4c44dbee95dc0c7554345fc8f6310bea4bbbeefca878dafe7cdcb')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
_filename=./MoonFM-${pkgver}-${arch}.AppImage

prepare() {
  cd "${srcdir}"

  chmod +x ${_filename}
  ${_filename} --appimage-extract
  sed -i "s,Exec=AppRun,Exec=/usr/bin/${_pkgname} %U,g" "squashfs-root/${_pkgname}.desktop"
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:

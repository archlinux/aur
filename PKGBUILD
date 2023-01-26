# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=osm2world
pkgver=0.3.1
pkgrel=1
pkgdesc="Converter that creates three-dimensional models of the world from OpenStreetMap data."
arch=('any')
url="http://osm2world.org/"
license=('LGPL3')
depends=('java-runtime>=17')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("https://osm2world.org/download/files/${pkgver}/OSM2World-${pkgver}-bin.zip"
        "${pkgname}.desktop")
sha256sums=('7acbf32e09427b3777b8a4b56b830a8ba8b566ceb1a5c76da672b60231e99634'
            '01e2f58c5960655d123c7ed87d293a38b8bf0dffe34d63880c27b270f241dd07')
noextract=("OSM2World-${pkgver}-bin.zip")


package() {
  # create opt destination
  dest="${pkgdir}/opt/${pkgname}"
  install -dm644 "${dest}"
  cd "${dest}"
  # extract into opt
  bsdtar -xf "${srcdir}/OSM2World-${pkgver}-bin.zip" \
    --exclude "LICENSE.txt" --exclude "osm2world-windows.bat"
  # binary symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # desktop entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}

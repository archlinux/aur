# Maintainer: Kerolos Zaki <kerolos4zaki@gmail.com>

pkgname=dawayer
pkgdesc="An ordinary audio player built with web technologies"
arch=("x86_64")
url="https://gitlab.com/hpj/Dawayer"
license=("MIT")
depends=('nodejs' 'c-ares' 'gtk3' 'libxss' 'nss')

package() {
  # Describe package as AUR
  # Remove last character ('}') and replace it with ',package:"AUR"}'
  sed -i "$ s/.$//" "${srcdir}/Dawayer/resources/app/build.json"
  echo ",\"package\":\"AUR\"}" >> "${srcdir}/Dawayer/resources/app/build.json"

  # Install the main files.
  install -d "${pkgdir}/opt/Dawayer"
  cp -a "${srcdir}/Dawayer/." "${pkgdir}/opt/Dawayer"

  # Exec bit
  chmod 755 "${pkgdir}/opt/Dawayer/Dawayer"

  # Desktop Entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/Dawayer.desktop" "${pkgdir}/usr/share/applications"
  sed -i "s%/usr/share%/opt%" "${pkgdir}/usr/share/applications/Dawayer.desktop"

  # Main binary
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/Dawayer/Dawayer" "${pkgdir}/usr/bin/dawayer"

  # Copy the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/Dawayer.png"
}
pkgver=1557939663005
pkgrel=1
source=('icon.png' 'Dawayer.desktop' 'Dawayer-1557939663005.tar.xz'::'https://gitlab.com/hpj/Dawayer/-/jobs/213136744/artifacts/raw/public/Dawayer.tar.xz
')
md5sums=('d57d7316ee7ab96130fc6a8c07d1ae3f' 'f31321605a55d19fb385ba4ae97ea1e8' '2518fe23659e81098f1f765b055f953e')

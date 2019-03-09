# Maintainer: Kerolos Zaki <kerolos4zaki@gmail.com>

pkgname=dawayer
pkgrel=1
pkgdesc="An ordinary audio player"
arch=("x86_64")
url="https://gitlab.com/herpproject/Dawayer"
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
pkgver=1552099207370
source=('icon.png' 'Dawayer.desktop' 'https://gitlab.com/herpproject/Dawayer/-/jobs/174508276/artifacts/raw/public/Dawayer.tar.xz
')
md5sums=('d57d7316ee7ab96130fc6a8c07d1ae3f' 'e406095b0807377b9e779d910da220a6' '11d60ba98b0c18085e31de0a5f365155')

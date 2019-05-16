# Maintainer: Kerolos Zaki <kerolos4zaki@gmail.com>

pkgname=sulaiman
pkgdesc="A modern keyboard launcher built with web technologies"
arch=("x86_64")
url="https://gitlab.com/hpj/Sulaiman"
license=("MIT")
depends=('nodejs' 'c-ares' 'gtk3' 'libxss' 'nss')

package() {
  # Describe package as AUR
  # Remove last character ('}') and replace it with ',package:"AUR"}'
  #sed -i "$ s/.$//" "${srcdir}/Sulaiman/resources/app/build.json"
  #echo ",\"package\":\"AUR\"}" >> "${srcdir}/Sulaiman/resources/app/build.json"

  # Install the main files.
  install -d "${pkgdir}/opt/Sulaiman"
  cp -a "${srcdir}/Sulaiman/." "${pkgdir}/opt/Sulaiman"

  # Exec bit
  chmod 755 "${pkgdir}/opt/Sulaiman/Sulaiman"

  # Desktop Entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/Sulaiman.desktop" "${pkgdir}/usr/share/applications"
  sed -i "s%/usr/share%/opt%" "${pkgdir}/usr/share/applications/Sulaiman.desktop"

  # Main binary
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/Sulaiman/Sulaiman" "${pkgdir}/usr/bin/sulaiman"

  # Copy the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/Sulaiman.png"
}
pkgver=1558021520852
pkgrel=1
source=('icon.png' 'Sulaiman.desktop' 'Sulaiman-1558021520852.tar.xz'::'https://gitlab.com/hpj/Sulaiman/-/jobs/213862527/artifacts/raw/public/Sulaiman.tar.xz
')
md5sums=('29f6faca0ab8a3614cacb41bd6d06aef' '493da0565241adc188c24f22b3c13cdb' '517ac01b4d9969bba37e0c2c744cd762')

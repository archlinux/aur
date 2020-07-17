# Maintainer: Sergey Borodulya <sevrykov.sergey@gmail.com>
pkgname="figma-linux-font-helper"
pkgver="0.1.5"
pkgrel="1"
pkgdesc="Font Helper for Figma for Linux OS."
arch=("x86_64")
url="https://github.com/Figma-Linux/figma-linux-font-helper"
license=('GPL2')
source=("https://github.com/Figma-Linux/${pkgname}/releases/download/v${pkgver}/fonthelper.tar.xz")
sha256sums=("1e979b44c350b3428aa3b960026b73b350a36ab1c86237e2a74b256f8465c23e")
package() {
  cat > "${srcdir}"/fonthelper.conf << EOF
{
  "port": "18412",
  "directories": [
    "/usr/share/fonts",
    "$HOME/.local/share/fonts"
  ]
}
EOF
  install -D "${srcdir}"/fonthelper "${pkgdir}"/opt/FontHelper/fonthelper
  install -D "${srcdir}"/libfreetype.so.6 "${pkgdir}"/opt/FontHelper/libfreetype.so.6
  install -D "${srcdir}"/fonthelper.conf "${pkgdir}"/etc/figma-linux/fonthelper
  install -Dm644 "${srcdir}"/fonthelper.service "${pkgdir}"/usr/lib/systemd/system/fonthelper.service
}
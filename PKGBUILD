# Maintainer: Rakesh KP <rakeshkpk@gmail.com>
pkgname=symphonie-bin
pkgver=1.0.16
pkgrel=3
pkgdesc="A lightweight music player for local audio collection."
arch=('x86_64')
url="https://github.com/kprakesh1984/symphonie"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libsecret')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
  "https://github.com/kprakesh1984/symphonie/releases/download/linux-aur-release-v${pkgver}/symphonie-${pkgver}.tar.gz"
  "symphonie.desktop"
  "512x512.png"
)
sha256sums=('4c3b5f0b6b881d62fa75bf2a2a3264169c1b04d8e7505f762415d3e353dd9c92'
            '0fc89a411f6c4c0b5881d2fad4bb5e5e4a24775664b2a44014493ae7acbd3031'
            '66d1d7932ff2c541ace259eca426f8557c4f5853f416562b2162d69e6b69b122')

package() {
  appdir="/opt/${pkgname%-bin}"
  install -d "${pkgdir}${appdir}"

  # Enter the extracted source directory (make sure it's correct)
  cd "${srcdir}/symphonie-${pkgver}"

  # Copy all files to /opt/symphonie
  cp -a . "${pkgdir}${appdir}/"

  # Ensure the main binary is executable
  chmod +x "${pkgdir}${appdir}/Symphonie"

  # Symlink to /usr/bin for easier launching
  install -d "${pkgdir}/usr/bin"
  ln -s "${appdir}/Symphonie" "${pkgdir}/usr/bin/symphonie"

  # Install .desktop file and icon
  install -Dm644 "${srcdir}/symphonie.desktop" "${pkgdir}/usr/share/applications/symphonie.desktop"
  install -Dm644 "${srcdir}/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/symphonie.png"
}

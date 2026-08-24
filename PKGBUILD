# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=virtualgamepad-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A tool to use Android devices as gamepads for PCs (official portable build)"
arch=('x86_64')
url="https://github.com/kitswas/VirtualGamePad-PC"
license=('GPL-3.0')
depends=()
install=virtualgamepad.install
options=('!strip')
source=('virtualgamepad.desktop' 'virtualgamepad.png')
sha256sums=('c2d383bab2c5045d24cfe7a2463a35e19e827f14cfa79372ec28125514ccfcd2'
            'f1edbb027cef46a41c00024efac1053c257cc4f44089c30f6f1ed2a753151be3')
sha256sums_x86_64=('69500c41c174838b4b7ce3288a28c0d2d453501cddfd74c593d454776e24bb46')
source_x86_64=("${url}/releases/download/v${pkgver}/Virtual-Gamepad-Ubuntu.zip")
noextract=('Virtual-Gamepad-Ubuntu.zip')
package() {
  cd "${srcdir}"
  # extract to /opt
  mkdir -p "${pkgdir}/opt/virtualgamepad"
  bsdtar -xf "${srcdir}/Virtual-Gamepad-Ubuntu.zip" -C "${pkgdir}/opt/virtualgamepad"
  # make sure the binaries are executable
  chmod 755 "${pkgdir}/opt/virtualgamepad/bin/VGamepadPC"
  find "${pkgdir}/opt/virtualgamepad" -type f -name "*.so" -exec chmod 755 {} +
  find "${pkgdir}/opt/virtualgamepad" -type f -name "*.so.*" -exec chmod 755 {} +
  # create link at /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s '/opt/virtualgamepad/bin/VGamepadPC' "${pkgdir}/usr/bin/virtualgamepad"
  # install desktop file
  mkdir -p "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/virtualgamepad.desktop" "${pkgdir}/usr/share/applications/"
  # install icon
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -m644 "${srcdir}/virtualgamepad.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
}

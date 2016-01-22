# Maintainer: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>

pkgname=electron
pkgver=0.36.5
pkgrel=1
pkgdesc="Framework for writing cross-platform desktop applications using JavaScript, HTML and CSS."

arch=('arm' 'i686' 'x86_64')
url="https://github.com/atom/electron"
license=('MIT')

replaces=('atom-shell')

optdepends=('nodejs')
depends=('libgcrypt15' 'libnotify' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')

case $CARCH in
  'arm'   ) _arch='arm' ; sha256sums=('7c5362e334b79cf7804a25639b8a2da14e09ec92edc9580e93965857ba24496b');;
  'ia32'  ) _arch='ia32'; sha256sums=('9f4fa27adef648f8410cc05f92494df8cf8c9171d34669c44e7fc247fd2c396b');;
  'x86_64') _arch='x64' ; sha256sums=('e27694b238db3ce94df9909649cc5052656f26fb6d3ed8aba2ec72e4e08db1c5');;
esac

source=("electron.zip::https://github.com/atom/electron/releases/download/v${pkgver}/electron-v${pkgver}-linux-${_arch}.zip")

package() {
  rm "${srcdir}/electron.zip"

  install -d "${pkgdir}/usr/share/electron"
  cp -a "${srcdir}/." "${pkgdir}/usr/share/electron"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/electron/electron" "${pkgdir}/usr/bin/electron"

  install -Dm644 "${pkgdir}/usr/share/electron/LICENSE" "${pkgdir}/usr/share/licenses/electron/LICENSE"
  rm "${pkgdir}/usr/share/electron/LICENSE"
  ln -sf "/usr/lib/libgcrypt.so.11" "${pkgdir}/usr/share/electron/libgcrypt.so.11"
  ln -sf "/usr/lib/libnotify.so.4" "${pkgdir}/usr/share/electron/libnotify.so.4"
  ln -sf "/usr/lib/libudev.so" "${pkgdir}/usr/share/electron/libudev.so.0"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/electron/electron"
}

# Maintainer: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>

pkgname=electron
pkgver=0.28.1
pkgrel=1
pkgdesc="Framework for writing cross-platform desktop applications using JavaScript, HTML and CSS."

arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/atom/electron"

optdepends=('nodejs')
depends=('libgcrypt15' 'libnotify' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')
[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'
[[ $CARCH == 'x86_64' ]] && \
    sha256sums=('f78a609c23bb35fa564ad8d6ed62cd2a92213a4e5ab8103a069a953177ad44b9') || \
    sha256sums=('b7fcfad602f7e7b4cdf5c279d66ff077b176c1cb9fc0ee56697a185988634ed6')
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

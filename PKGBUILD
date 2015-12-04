# Maintainer: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>

pkgname=electron
pkgver=0.35.4
pkgrel=1
pkgdesc="Framework for writing cross-platform desktop applications using JavaScript, HTML and CSS."

arch=('arm' 'i686' 'x86_64')
url="https://github.com/atom/electron"
license=('MIT')

replaces=('atom-shell')

optdepends=('nodejs')
depends=('libgcrypt15' 'libnotify' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')

case $CARCH in
  'arm'   ) _arch='arm' ; sha256sums=('d3a87d389ad48994df4e3e660c96dd20b7adce202dab511e1715f3688f92f678');;
  'ia32'  ) _arch='ia32'; sha256sums=('4f15cf8e9b72139b9b1964b7d97e3baec7cb02a005e7680a3e31a4856ba62b85');;
  'x86_64') _arch='x64' ; sha256sums=('7a63833051d41af516fb84f24f6c29561c26daf9afc78372f1834d114a7504f9');;
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

# Maintainer: M0Rf30

pkgname=electron037
pkgver=0.37.8
pkgrel=1
pkgdesc="Framework for writing cross-platform desktop applications using JavaScript, HTML and CSS."
arch=('arm' 'i686' 'x86_64')
url="https://github.com/electron/electron"
license=('MIT')
replaces=('atom-shell')
optdepends=('nodejs')
depends=('libgcrypt15' 'libnotify' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')

case $CARCH in
  'arm'   ) _arch='arm' ; sha256sums=('eb4267d1bc95c7d99b65602753b098dccb028840897ff6dc4dda2b33accf8a19');;
  'i686'  ) _arch='ia32'; sha256sums=('d42e373284324ffd7fadbbf8ed0c6c21452ca375e969a7a9d3b5319e2f21bf45');;
  'x86_64') _arch='x64' ; sha256sums=('b850b55792df760984f18a1b594c954f06960a23e89c4d66e131f9ca735be22e');;
esac

source=("electron.zip::https://github.com/electron/electron/releases/download/v${pkgver}/electron-v${pkgver}-linux-${_arch}.zip")

package() {
  rm "${srcdir}/electron.zip"

  install -d "${pkgdir}/usr/share/electron037"
  cp -a "${srcdir}/." "${pkgdir}/usr/share/electron037"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/electron037/electron" "${pkgdir}/usr/bin/electron037"

  install -Dm644 "${pkgdir}/usr/share/electron037/LICENSE" "${pkgdir}/usr/share/licenses/electron037/LICENSE"
  rm "${pkgdir}/usr/share/electron037/LICENSE"
  ln -sf "/usr/lib/libgcrypt.so.11" "${pkgdir}/usr/share/electron037/libgcrypt.so.11"
  ln -sf "/usr/lib/libnotify.so.4" "${pkgdir}/usr/share/electron037/libnotify.so.4"
  ln -sf "/usr/lib/libudev.so" "${pkgdir}/usr/share/electron037/libudev.so.0"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/electron037/electron"
}

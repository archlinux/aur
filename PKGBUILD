# Maintainer: thadah <thadahdenyse@protonmail.com>
pkgname=sable-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="An almost stable Matrix client."
url="https://app.sable.moe/"
license=('AGPL-3.0-only')
arch=('x86_64')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libgcc' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator')
options=('!strip' '!emptydirs')
provides=('sable')
conflicts=('sable')
source=("${pkgname}-${pkgver}.deb::https://github.com/7w1/sable/releases/download/${pkgver}/sable-matrix-client-electron_0.0.1_amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('9be95e8771c2312b25a004bf5538db8c80774bc0ba99e11ed97bd3cd4bcfafac')

package() {
  cd "${srcdir}"
  bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  # Fix icon directory which is 0x0
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/sable-matrix-client-electron.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/sable-matrix-client-electron.png"
  rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0"
}

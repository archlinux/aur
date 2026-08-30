# Maintainer: shinka <shinnkka1@gmail.com>
# Contributor: The one with the braid <the-one@with-the-braid.cf>

pkgname=fluffychat-bin
_pkgname=fluffychat
pkgver=2.9.1
pkgrel=1
pkgdesc="Open. Nonprofit. Cute. Easy to use (matrix) messenger. Secure and decentralized."
arch=('x86_64') # 'aarch64'
url="https://fluffychat.im/"
license=('AGPL3')
depends=(
  'gtk3'
  # flutter_secure_storage
  'libsecret'
  'openssl'
  # path_provider
  'xdg-user-dirs'
  'webkit2gtk-4.1'
)
optdepends=(
  'zenity: for flutter_file_picker'
  'kdialog: for flutter_file_picker'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("fluffychat-v${pkgver}_x86_64.tar.gz::https://github.com/krille-chan/fluffychat/releases/download/v${pkgver}/fluffychat-linux-x64.tar.gz")
#source_aarch64=("fluffychat-v${pkgver}_aarch64.tar.gz::https://github.com/krille-chan/fluffychat/releases/download/v${pkgver}/fluffychat-linux-arm64.tar.gz")
sha256sums_x86_64=('1948ad823554c8580e1621d4e843181db4131f8557ad9cc4fcd9cf7f598bdeff')
# sha256sums_aarch64=('f3a25daebf0a4e827268f1005944b8c1b359b946b22ee8a792937e1babc40869')

package() {
  # install

  install -dm755 ${pkgdir}/opt/${_pkgname}/
  mv fluffychat ${pkgdir}/opt/${_pkgname}/
  mv data ${pkgdir}/opt/${_pkgname}/
  mv lib ${pkgdir}/opt/${_pkgname}/

  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # icon
  install -Dm 644 ${pkgdir}/opt/${_pkgname}/data/flutter_assets/assets/logo/mini/logo_mini.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # desktop entry

  install -dm 755 "${pkgdir}/usr/share/applications"
  cat >${pkgdir}/usr/share/applications/${_pkgname}.desktop <<EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=FluffyChat
Comment=${pkgdesc}
Exec=/opt/${_pkgname}/${_pkgname}
Icon=${_pkgname}
Terminal=false
Categories=Network;InstantMessaging;Chat;MatrixClient
EOF

}

# vim: set sw=2 ts=2 et:

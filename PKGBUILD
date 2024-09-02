# Maintainer: The one with the braid <the-one@with-the-braid.cf>

pkgname=fluffychat-bin
_pkgname=fluffychat
pkgver=1.22.1
pkgrel=1
pkgdesc="Open. Nonprofit. Cute. Easy to use (matrix) messenger. Secure and decentralized."
arch=('x86_64') # 'aarch64'
url="https://fluffychat.im/"
license=('AGPL3')
depends=(
        'gtk3'
        'jsoncpp'
        # flutter_secure_storage
        'libsecret'
        # path_provider
        'xdg-user-dirs'
        # for e2ee
        'libolm'
        # flutter_file_picker - see https://github.com/miguelpruivo/flutter_file_picker/blob/master/lib/src/linux/file_picker_linux.dart#L115
        'zenity'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("fluffychat-v${pkgver}_x86_64.tar.gz::https://github.com/krille-chan/fluffychat/releases/download/v${pkgver}/fluffychat-linux-x64.tar.gz")
#source_aarch64=("fluffychat-v${pkgver}_aarch64.tar.gz::https://github.com/krille-chan/fluffychat/releases/download/v${pkgver}/fluffychat-linux-arm64.tar.gz")
sha256sums_x86_64=('49a98639c40be0d0b403f978b42b7d9403a3196fc10203dfd20e4888eec04e3e')
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
  install -Dm 644 ${pkgdir}/opt/${_pkgname}/data/flutter_assets/assets/favicon.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # desktop entry

  install -dm 755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${_pkgname}.desktop << EOF
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

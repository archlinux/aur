# Maintainer: garionion <garionion at entr0py.de>
# Contributor: kescherAUR

pkgname=fluffychat-bin
_pkgname=fluffychat
pkgver=0.42.2
pkgrel=2
pkgdesc="Chat with your friends"
arch=('x86_64'  'aarch64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=('libolm' 'xdg-user-dirs' 'gtk3' 'jsoncpp' 'libsecret')
makedepends=('unzip')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("fluffychat-v${pkgver}_x86_64.tar.zst::https://proxy.git.entr0py.de/garionion/fluffychat/releases/download/tag:v${pkgver}/fluffychat-linux-x86.tar.zst")
source_aarch64=("fluffychat-v${pkgver}_aarch64.tar.gz::https://gitlab.com/api/v4/projects/16112282/packages/generic/fluffychat/${pkgver}/fluffychat-linux-arm64.tar.gz")
sha256sums_x86_64=('60bf28c0ada6f4fc8290ac75c5b8ec94b2c6426a913b7012452dbcb4eca5d068')
sha256sums_aarch64=('f9e8cfd6c1c708128dc6c9444174be621b92a9d7b9a7120b273b13c0af59d8e7')


package() {  
  # install

  install -dm755 ${pkgdir}/opt/${_pkgname}/
  mv ${_pkgname} ${pkgdir}/opt/${_pkgname}/
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
Comment=Matrix Client. Chat with your friends
Exec=/opt/${_pkgname}/${_pkgname}
Icon=${_pkgname}
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:

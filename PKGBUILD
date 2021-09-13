# Maintainer: garionion <garionion at entr0py.de>
# Contributor: kescherAUR

pkgname=fluffychat-bin
_pkgname=fluffychat
pkgver=0.40.0
_gitea_uuid="b1fb5ce5-6249-40e3-b7c5-e359411f63e2"
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64') # 'aarch64') #no arm64 build
url="https://fluffychat.im/"
license=('AGPL3')
depends=('libolm' 'xdg-user-dirs' 'gtk3' 'jsoncpp' 'libsecret')
makedepends=('unzip')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("fluffychat-v${pkgver}_x86_64.tar.zst::https://git.entr0py.de/attachments/${_gitea_uuid}")
#source_aarch64=("fluffychat-v${pkgver}_aarch64.tar.gz::https://gitlab.com/api/v4/projects/16112282/packages/generic/fluffychat/${pkgver}/fluffychat-linux-arm64.tar.gz")
sha256sums_x86_64=('6273f917ad726a06915ce36b467da3d3cbb0e8372b4f3db2528d2b6ff33abf0e')
#sha256sums_aarch64=('38dc8cc64dfb2d75503c42a10dae3091cb3c620fc2a5f0056320426c6ff91325')


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

# Maintainer: garionion <garionion at entr0py.de>
# Contributor: kescherAUR

pkgname=fluffychat-bin
_pkgname=fluffychat
pkgver=1.1.0
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
sha256sums_x86_64=('c041dcd1e3ed8b4436dcbbba629b54b8d1eee3151a3b5e97a27e03a123c39e80')
sha256sums_aarch64=('57d1230344bbadd1ff19505855eda65fd22edf8056014c7b395987bfb73da485')


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

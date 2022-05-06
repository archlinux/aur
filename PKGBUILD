# Maintainer: garionion <garionion at entr0py.de>
# Contributor: kescherAUR

pkgname=fluffychat-bin
_pkgname=fluffychat
pkgver=1.4.0
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64' )
url="https://fluffychat.im/"
license=('AGPL3')
depends=('gtk3' 'jsoncpp' 'libsecret')
makedepends=('unzip')
optdepends=('libolm: E2E Encryption support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("fluffychat-v${pkgver}_x86_64.tar.zst::https://gap.cdn.entr0py.cloud/garionion/fluffychat/releases/download/tag:v${pkgver}/fluffychat-linux-x86.tar.zst")
#source_aarch64=("fluffychat-v${pkgver}_aarch64.tar.gz::https://gitlab.com/api/v4/projects/16112282/packages/generic/fluffychat/${pkgver}/fluffychat-linux-arm64.tar.gz")
sha256sums_x86_64=('c4a1a367a9642a1eb34462804975eeb05094391cb8f1c7dba9c3dbb01931b956')
#sha256sums_aarch64=('e4e927f9b5a5db6b4836700a19b6e7a64f409ca3aba4c09ffa8793456f7e4008')


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

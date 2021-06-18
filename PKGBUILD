# Maintainer: garionion <garionion at entr0py.de>

pkgname=fluffychat-bin
_pkgname=fluffychat
pkgver=0.32.0
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=('libolm' 'xdg-user-dirs')
makedepends=('unzip')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "fluffychat-${pkgver}.tar.gz::https://gitlab.com/api/v4/projects/16112282/packages/generic/fluffychat/${pkgver}/fluffychat-linux-x86.tar.gz")
sha256sums=('bdb81186b07dbf094f14e3b59d1c6cbf7d3ace881ec3f4d466b2906435315966')


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

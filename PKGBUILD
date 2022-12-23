# Maintainer: garionion <garionion at entr0py.de>
# Contributor: kescherAUR

pkgname=fluffychat-bin
_pkgname=fluffychat
pkgver=1.7.2
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64') # 'aarch64' )
url="https://fluffychat.im/"
license=('AGPL3')
depends=('gtk3' 'jsoncpp' 'libsecret')
makedepends=('unzip')
optdepends=('libolm: E2E Encryption support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("fluffychat-v${pkgver}_x86_64.tar.gz::https://gitlab.com/api/v4/projects/16112282/packages/generic/fluffychat/${pkgver}/fluffychat-linux-x86.tar.gz")
# source_aarch64=("fluffychat-v${pkgver}_aarch64.tar.gz::https://gitlab.com/api/v4/projects/16112282/packages/generic/fluffychat/${pkgver}/fluffychat-linux-arm64.tar.gz")
sha256sums_x86_64=('e604a1bddb46e639f632ef165898e121daa28ef4b862290846ccfd6dc2e1fe93')
# sha256sums_aarch64=('e65aab42e3df9533b097821704e06df2c9388d018505677aadff7adf5dc108e5')


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
Comment=Open. Nonprofit. Cute. Easy to use (matrix) messenger. Secure and decentralized.
Exec=/opt/${_pkgname}/${_pkgname}
Icon=${_pkgname}
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:

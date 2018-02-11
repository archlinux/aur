# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Rick Kerkhof <rick.2889@gmail.com>

pkgname=soundnode-app-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="Unofficial Soundcloud client for the desktop build with Electron"
arch=('x86_64')
url="http://www.soundnodeapp.com/"
license=('GPL3')
conflicts=('soundnode' 'soundnode-git')
provides=('soundnode')
options=('!strip')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libnotify' 'fontconfig' 'libxss')
source=("https://github.com/Soundnode/soundnode-app/releases/download/${pkgver}/Soundnode-linux-x64.tar.xz"
        "https://raw.githubusercontent.com/Soundnode/soundnode-app/${pkgver}/app/soundnode.png"
        'soundnode.desktop')
sha256sums=('f45d389ad83db00e1eb9a735e24fa2a25b5819ffc29ee0728baffdba8e4d12bc'
            'a16acc740d94ed119f943e810f44cdb2d082153645aafc1c179f15fb5b9a7619'
            'b5534a261b91881fe173052c9ede70dc385f105b5d7586af16edab079a115270')
PKGEXT='.pkg.tar'

package() {
  cd ${srcdir}/Soundnode-linux-x64
  install -d ${pkgdir}/usr/{bin,share/{applications,pixmaps,licenses/${pkgname}}}
  install -d ${pkgdir}/opt/soundnode
  install -D ../soundnode.desktop ${pkgdir}/usr/share/applications/
  install -D ../soundnode.png ${pkgdir}/usr/share/pixmaps/
  ln -s /opt/soundnode/Soundnode ${pkgdir}/usr/bin/soundnode
  cp -r * ${pkgdir}/opt/soundnode
  cp -r ${pkgdir}/opt/soundnode/resources/app/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/
  mv ${pkgdir}/opt/soundnode/LICENS{E,ES.chromium.html} ${pkgdir}/usr/share/licenses/${pkgname}/
}

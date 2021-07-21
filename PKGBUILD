# Contributor: Arnaud Lier <zeprofdecoding@gmail.com>
# Contributor: Adrien Navratil <adrien1975@live.fr>
# Maintainer: Arnaud Lier <zeprofdecoding@gmail.com>

pkgname=nationsglory-launcher
pkgver=1
pkgrel=1
pkgdesc="NationsGlory Launcher"
arch=('x86_64')
url="https://nationsglory.fr"
license=('All rights reserved')
depends=('openssl' 'alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'atk' 'dbus' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'zlib' 'java-runtime' 'xorg-xrandr')
optdepends=('flite: narrator support')
provides=('nationsglory-launcher')
source=(https://launcher.nationsglory.fr/files/NationsGlory.tar.gz)
sha256sums=(
'1606d1613074068381ee3fe785da2eb2ba738854f416daee04e597bcac94093f'
)

prepare() {
  cd "$srcdir"
  if [ -d data ]; then
    mv data .lightslark
  fi

  .lightslark/lightslark apply .
  chmod u+x ng-desktop

  sed -ie "s/Icon=icon.png/Icon=nationsglory-launcher/" ng-desktop
  sed -ie "s/Exec=PWD\/NationsGlory/Exec=nationsglory-launcher/" ng-desktop
}

package () {
  cd "$pkgdir"

  install -Dm644 "$srcdir/icon.png"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/nationsglory-launcher.png"
  install -Dm644 "$srcdir/ng-desktop"    "$pkgdir/usr/share/applications/fr.nationsglory.NationsGloryLauncher.desktop"

  mkdir -p "${pkgdir}"/opt/nationsglory-launcher
  mv  "${srcdir}/"* "${pkgdir}"/opt/nationsglory-launcher/

  mkdir -p "${pkgdir}"/usr/bin

  ln -sf "${pkgdir}"/opt/nationsglory-launcher/NationsGlory "${pkgdir}"/usr/bin/nationsglory-launcher
}

# Maintainer: Zhiqiang ZHOU <aur@strrl.dev>
pkgname=raft-desktop-bin
pkgver=1.32.0
pkgrel=1
pkgdesc='Collaborative human and AI messaging desktop app'
arch=('x86_64')
url='https://raft.build'
license=('LicenseRef-custom')
depends=('bash' 'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'libgcc' 'hicolor-icon-theme' 'systemd-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
optdepends=('nodejs: run the bundled command line tool' 'libappindicator-gtk3: system tray integration')
provides=('raft-desktop')
conflicts=('raft-desktop')
options=('!strip' '!debug')
source=("https://github.com/botiverse/desktop/releases/download/v${pkgver}/Raft-Desktop-${pkgver}-amd64.deb")
sha256sums=('70f18b05efae820aa553c01c8f3ee1ce57b1ab326b3e415ed38b6de32419d6d0')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/opt/Raft Desktop" "$pkgdir/opt/raft-desktop"
  rm "$pkgdir/opt/raft-desktop/resources/app-update.yml"
  rm "$pkgdir/opt/raft-desktop/resources/package-type"
  install -dm755 "$pkgdir/usr/bin"
  ln -s '/opt/raft-desktop/raft-desktop' "$pkgdir/usr/bin/raft-desktop"

  sed -i \
    -e 's|^Exec=.*|Exec=raft-desktop %U|' \
    -e 's|^Comment=.*|Comment=Collaborative human and AI messaging|' \
    "$pkgdir/usr/share/applications/raft-desktop.desktop"

  chmod 4755 "$pkgdir/opt/raft-desktop/chrome-sandbox"
  install -Dm644 "$pkgdir/opt/raft-desktop/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$pkgdir/opt/raft-desktop/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

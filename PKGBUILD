# Maintainer: 9M2PJU <https://hamradio.my>
pkgname=localfly-linux-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Your localhost, on the internet - bore tunnels with an Adwaita window + tray (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/localfly-linux"
license=('MIT')
depends=('python-gobject' 'gtk4' 'libadwaita' 'curl' 'hicolor-icon-theme')
optdepends=('qrencode: QR codes for phone testing'
            'libsecret: GNOME Keyring secret storage')
provides=('localfly-linux')
conflicts=('localfly-linux' 'localfly-linux-git')
source_x86_64=("localfly-v0.1.1-x86_64-unknown-linux-gnu.tar.gz::https://github.com/9M2PJU/localfly-linux/releases/download/v0.1.1/localfly-v0.1.1-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('992aed25b74e8d5062367d260a30feb4ea089c5a5c02b5a4d7e053c6e2877ed8')
source_aarch64=("localfly-v0.1.1-aarch64-unknown-linux-gnu.tar.gz::https://github.com/9M2PJU/localfly-linux/releases/download/v0.1.1/localfly-v0.1.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('ad7511618a13bff374eb8f3b35a288502b3a65132cbb77c5ac3f0abd62854400')

package() {
  cd "localfly-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 localfly "$pkgdir/usr/bin/localfly"
  install -Dm755 localflyd "$pkgdir/usr/bin/localflyd"
  install -Dm755 gui/localfly-gui "$pkgdir/usr/bin/localfly-gui"
  install -Dm644 gui/localfly_backend.py "$pkgdir/usr/share/localfly/gui/localfly_backend.py"
  install -Dm644 gui/localfly_gui.py "$pkgdir/usr/share/localfly/gui/localfly_gui.py"
  install -Dm644 gui/sni.py "$pkgdir/usr/share/localfly/gui/sni.py"
  install -Dm644 com.localfly.Localfly.desktop "$pkgdir/usr/share/applications/com.localfly.Localfly.desktop"
  install -Dm644 com.localfly.Localfly.metainfo.xml "$pkgdir/usr/share/metainfo/com.localfly.Localfly.metainfo.xml"
  install -Dm644 localfly.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/localfly.png"
  install -Dm644 localfly-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/localfly.png"
  install -Dm644 localfly-live.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/localfly-live.png"
  install -Dm644 localfly-live-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/localfly-live.png"
  install -Dm644 completions/localfly.bash "$pkgdir/usr/share/bash-completion/completions/localfly"
  install -Dm644 completions/localflyd.bash "$pkgdir/usr/share/bash-completion/completions/localflyd"
  install -Dm644 completions/_localfly "$pkgdir/usr/share/zsh/site-functions/_localfly"
  install -Dm644 completions/_localflyd "$pkgdir/usr/share/zsh/site-functions/_localflyd"
  install -Dm644 completions/localfly.fish "$pkgdir/usr/share/fish/vendor_completions.d/localfly.fish"
  install -Dm644 completions/localflyd.fish "$pkgdir/usr/share/fish/vendor_completions.d/localflyd.fish"
  install -Dm644 man/localfly.1 "$pkgdir/usr/share/man/man1/localfly.1"
  install -Dm644 man/localflyd.1 "$pkgdir/usr/share/man/man1/localflyd.1"
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/localfly up|' localfly.service > localfly.service.pkg
  install -Dm644 localfly.service.pkg "$pkgdir/usr/lib/systemd/user/localfly.service"
}

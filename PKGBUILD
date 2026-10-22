# Maintainer: mak <mak@localhost>
pkgname=infamous-pc-bin
pkgver=2026.10.21.da39b0b
pkgrel=3
pkgdesc="inFAMOUS Second Son native PC port (requires your own game dump)"
arch=('x86_64')
url="https://github.com/HayatoG/iss_pc"
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'vulkan-icd-loader')
provides=('infamous-pc')
conflicts=('infamous-pc')
options=('!strip')
install=infamous-pc-bin.install
source=("infamous-linux-x86_64.tar.gz::https://github.com/HayatoG/iss_pc/releases/download/v2026.10.21-da39b0b/infamous-linux-x86_64.tar.gz"
        'LICENSE'
        'infamous-pc'
        'infamous-pc.desktop'
        'infamous-pc-bin.install')
sha256sums=('6600571c19983da90cf4477afd4cbef1d9f33d31ccfa926869e04c82f3e08e6a'
            'edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6'
            '73b5a290e3bc227a9224e62e9bdfa7ffdf98ad81007a27762d7b9da866ccf573'
            '3af0f5f9271fac8d4efde06cdbd1963161ae73ef3800f72ba834e753fad501a2'
            '82f9e9fb82e71658fbe8e74c99f55ab9ce7e7bd78802a01520a8abce5e3b9bb6')

package() {
  install -d "$pkgdir/opt/ports/infamous-pc"
  cp -a "$srcdir/infamous-linux-x86_64/." "$pkgdir/opt/ports/infamous-pc/"
  # The port writes boot images, patches and logs into out/ at runtime.  Upstream
  # expects a user-writable tree; /opt is root-owned, so make out/ a shared
  # runtime directory.  The sticky bit keeps package files protected.
  chmod 1777 "$pkgdir/opt/ports/infamous-pc/out"
  install -Dm755 "$srcdir/infamous-pc" "$pkgdir/usr/bin/infamous-pc"
  install -Dm644 "$srcdir/infamous-pc.desktop" \
    "$pkgdir/usr/share/applications/infamous-pc.desktop"
  install -Dm644 "$pkgdir/opt/ports/infamous-pc/launcher/infamous.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/infamous-pc.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

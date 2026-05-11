pkgname=iscsi-util
pkgver=2.0.3
pkgrel=3
pkgdesc="A simple and modern GUI for managing iSCSI targets and sessions."
arch=('x86_64')
license=('MIT')
url="https://github.com/mijocecr/iscsi-util"

depends=(
  'open-iscsi'          # iscsiadm + iscsid (OBLIGATORIO)
  'libnotify'           # notify-send para NotificadorLinux
)


source=(
  "https://github.com/mijocecr/iscsi-util/releases/download/iscsi-util_v2.1/ISCSI-Util.tar.gz"
  "iscsi-util.desktop"
  "iscsi-util.png"
)

sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {

  # Instalar bundle en /usr/lib/iscsi-util
  install -d "$pkgdir/usr/lib/iscsi-util"
  cp -r "$srcdir"/ISCSI-Util/* "$pkgdir/usr/lib/iscsi-util/"

  # Symlink en /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/iscsi-util/ISCSI-Util "$pkgdir/usr/bin/iscsi-util"

  # Desktop entry
  install -Dm644 "$srcdir/iscsi-util.desktop" \
    "$pkgdir/usr/share/applications/iscsi-util.desktop"

  # Icono
  install -Dm644 "$srcdir/iscsi-util.png" \
    "$pkgdir/usr/share/pixmaps/iscsi-util.png"
}

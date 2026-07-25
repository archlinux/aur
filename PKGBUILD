pkgname=samba-util-bin
pkgver=3.5.1
pkgrel=4
pkgdesc="A simple and modern GUI for managing Samba."
arch=('x86_64')
license=('MIT')
url="https://github.com/mijocecr/samba-util"

depends=(
  'samba'          # smbd, nmbd, smb.conf, libsmbclient
  'systemd'        # servicios
  'cifs-utils'     # mount.cifs
  'linux-headers'  # compatibilidad kernel
)

optdepends=(
  'gvfs-smb: integración con exploradores de archivos'
  'nss-mdns: descubrimiento de red mDNS'
  'avahi: soporte para mDNS/zeroconf'
)

options=('!debug' '!strip')

source=("https://github.com/mijocecr/samba-util/releases/download/samba-util_v3.5/SAMBA-Util.tar.gz")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/lib/samba-util"
  cp -r "$srcdir"/* "$pkgdir/usr/lib/samba-util/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/samba-util/SAMBA-Util "$pkgdir/usr/bin/samba-util"

  install -Dm644 "$srcdir/samba-util.desktop" "$pkgdir/usr/share/applications/samba-util.desktop"
  install -Dm644 "$srcdir/samba-util.png" "$pkgdir/usr/share/pixmaps/samba-util.png"
}

pkgname=gephgui-wry-bin
pkgver=5.8.0
pkgrel=3
pkgdesc="Geph desktop GUI"
arch=('x86_64')
url="https://github.com/geph-official/gephgui-wry"
download_url="https://github.com/geph-official/gephgui-pkg/releases/download"
license=('MPL-2.0' 'BSD-3-Clause')
provides=('gephgui-wry' 'geph5-client' 'geph5')
conflicts=('gephgui-wry' 'geph5-client' 'geph5-client-git' 'geph5-app-git')
depends=(
  'webkit2gtk-4.1'
  'polkit'
  'nftables'
  'iproute2'
  'libxdo3'
)
options=('!strip' '!debug')
source=(
  "gephgui-wry-bin-$pkgver.deb::$download_url/v$pkgver/geph-linux-${pkgver}.deb"
  "geph.png::https://raw.githubusercontent.com/geph-official/gephgui-pkg/refs/heads/master/flatpak/icons/256x256/apps/io.geph.GephGui.png"
)
sha256sums=('eb1204ed2479b1128913fe5de6efa59bc90fe9df9412f1e8d8a29e7248c85374'
            '6b1ee5653cdc69a4e92125950cca5f2bd8114cd786a9a686aa31692b9fcc287a')

package() {
  bsdtar -xf "${srcdir}/data.tar.zst" -C "$pkgdir"

  install -Dm644 "${srcdir}/geph.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/geph.png"

  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -exec chmod 644 {} +
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
  find "$pkgdir/usr/lib" -type f -exec chmod 755 {} + 2>/dev/null || true
}

pkgname=gephgui-wry-bin
pkgver=5.3.1
pkgrel=1
pkgdesc="Geph desktop GUI"
arch=('x86_64')
url="https://github.com/geph-official/gephgui-wry"
download_url="https://github.com/geph-official/gephgui-pkg/releases/download"
license=('MPL-2.0')
provides=('gephgui-wry')
conflicts=('gephgui-wry')
depends=('webkit2gtk-4.1')
source=(
  "gephgui-wry-bin-$pkgver.deb::$download_url/v$pkgver/gephgui-wry_${pkgver}_amd64.deb"
  "geph.png::https://raw.githubusercontent.com/geph-official/gephgui-pkg/refs/heads/master/flatpak/icons/256x256/apps/io.geph.GephGui.png"
)
md5sums=('31e1be738fbe3aeb4f5c4926adc4a8f3'
         '4655e64a5d56c316383e1ffa79ddc772')

package() {
  bsdtar -xf "${srcdir}/data.tar.zst" -C "$pkgdir"

  install -Dm644 "${srcdir}/geph.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/geph.png"

  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -exec chmod 644 {} +
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
  find "$pkgdir/usr/lib" -type f -exec chmod 755 {} + 2>/dev/null || true
}


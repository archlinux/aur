# Maintainer: VisorCraft Packages <packages@visorcraft.com>

pkgname=mongrel
pkgver=5.70.8
pkgrel=1
pkgdesc="Desktop control plane for databases, APIs, terminals, containers, and Kubernetes"
arch=(x86_64)
url="https://www.visorcraft.com/"
license=(LicenseRef-Proprietary)
depends=(fuse2)
options=(!strip)
source_x86_64=(
  "$pkgname-$pkgver.AppImage::https://downloads.visorcraft.com/mongrel/$pkgver/Mongrel_${pkgver}_amd64.AppImage"
  "$pkgname-$pkgver.AppImage.sig::https://downloads.visorcraft.com/mongrel/$pkgver/Mongrel_${pkgver}_amd64.AppImage.sig"
)
sha256sums_x86_64=(
  "c7de5a4f05a8e1e6316aae7fa8335e3f61438d0305fc1de3722a1615dc365df0"
  "SKIP"
)
validpgpkeys=("1FEE29F48CBCAEDCA3A8A005ADDE097CAA99B277")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver.AppImage" "$pkgdir/opt/mongrel/Mongrel.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/mongrel/Mongrel.AppImage "$pkgdir/usr/bin/mongrel"

  cd "$srcdir"
  chmod +x "$pkgname-$pkgver.AppImage"
  "./$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null
  install -Dm644 squashfs-root/mongrel.desktop "$pkgdir/usr/share/applications/mongrel.desktop"
  install -Dm644 squashfs-root/mongrel.png "$pkgdir/usr/share/pixmaps/mongrel.png"
}

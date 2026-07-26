# Maintainer: VisorCraft Packages <packages@visorcraft.com>

pkgname=mongrel
pkgver=5.70.5
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
  "5648e724a8ef9c3382e2fdccf2218426b6bd6280976ee1788f4eeb9d89024e00"
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

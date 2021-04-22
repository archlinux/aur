# Maintainer: Kitware <kitware@kitware.com>
# Contributor: Dmitry Golgovsky <d.westcoast@aol.com>

pkgname=veloview
pkgver=4.1.3
pkgrel=1
pkgdesc="Real-time visualization and processing of live captured 3D LiDAR data from Velodyne’s HDL sensors"
arch=(x86_64)
license=(BSD)
url="https://www.paraview.org/veloview"
makedepends=(gendesk)
source=("veloview.svg"
        "VeloView-$pkgver-Linux-64bit.tar.gz::https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.4&type=app&downloadFile=VeloView-$pkgver-Linux-64bit.tar.gz")
sha256sums=('1178d1aad246985bf56da1228298ee8a99d8e487309d3ddc39a9d071fb52a6ad'
            '66237a2f6f5060cfd4c885243d859f56df6f60ef0b51962060f84dc8b470b600')

prepare() {
  gendesk --pkgname=VeloView --pkgdesc="$pkgdesc" --categories=Network PKGBUILD
}

package() {
  install -d "$pkgdir"/usr/local/bin
  cp -a --no-preserve=ownership "$srcdir"/VeloView-$pkgver-Linux-64bit/bin "$pkgdir"/usr/local/

  install -d "$pkgdir"/usr/local/lib
  cp -a --no-preserve=ownership "$srcdir"/VeloView-$pkgver-Linux-64bit/lib "$pkgdir"/usr/local/

  install -d "$pkgdir"/usr/local/share
  cp -a --no-preserve=ownership "$srcdir"/VeloView-$pkgver-Linux-64bit/share "$pkgdir"/usr/local/

  install -Dm644 "$srcdir"/VeloView.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 "$srcdir"/$pkgname.svg "$pkgdir"/usr/share/pixmaps/VeloView.svg
}


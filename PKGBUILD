# Maintainer: Kitware <kitware@kitware.com>
# Contributor: Dmitry Golgovsky <d.westcoast@aol.com>

pkgname=veloview
pkgver=3.5.0
pkgrel=1
pkgdesc="Real-time visualization and processing of live captured 3D LiDAR data from Velodyne’s HDL sensors"
arch=(x86_64)
license=(BSD)
url="https://www.paraview.org/veloview"
makedepends=(gendesk)
source=("veloview.svg"
        "VeloView-$pkgver-Linux-64bit.tar.gz::https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.1&type=app&os=win32&downloadFile=VeloView-$pkgver-Linux-64bit.tar.gz")
sha256sums=('1178d1aad246985bf56da1228298ee8a99d8e487309d3ddc39a9d071fb52a6ad'
            '03ec0a00816a0c43bb8436bb94a4a5d0d78b25fb7915577241e716796522c507')

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


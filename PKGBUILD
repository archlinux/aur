# Maintainer: Dmitry Golgowski <d.westcoast@aol.com>

pkgname=veloview
pkgver=5.1.0
pkgrel=1
pkgdesc="Real-time visualization and processing of live captured 3D LiDAR data from Velodyne's HDL sensors"
arch=(x86_64)
license=(BSD-3-Clause)
url="https://www.paraview.org/veloview"
depends=('libglvnd' 'libxcb' 'libxkbcommon' 'dbus')
makedepends=(gendesk)
_archive="VeloView-${pkgver}-Ubuntu18.04-x86_64"
source=("veloview.svg"
        "VeloView-${pkgver}-Linux-64bit.tar.gz::https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.9&type=app&os=Linux&downloadFile=${_archive}.tar.gz")
sha256sums=('1178d1aad246985bf56da1228298ee8a99d8e487309d3ddc39a9d071fb52a6ad'
            'a398705060fafcebbb9f37c99b1c3c09922e6469697dae4f04a3c927c1ca8b32')

prepare() {
  gendesk --pkgname=VeloView --pkgdesc="$pkgdesc" --exec=/opt/veloview/bin/VeloView --categories="Science;DataVisualization" PKGBUILD
}

package() {
  install -dm755 "$pkgdir"/opt/veloview
  cp -a --no-preserve=ownership "$srcdir"/${_archive}/{bin,lib,plugins,share} "$pkgdir"/opt/veloview/

  install -dm755 "$pkgdir"/usr/bin
  ln -s /opt/veloview/bin/VeloView "$pkgdir"/usr/bin/veloview

  install -Dm644 "$srcdir"/VeloView.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 "$srcdir"/$pkgname.svg "$pkgdir"/usr/share/pixmaps/VeloView.svg
}

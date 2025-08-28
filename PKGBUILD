# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.8.1
_tag=1.8.1-release
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD-2-Clause')
depends=(
  python-numpy
  python-tqdm
  python-opencv
  python-scenedetect
)
makedepends=(
  python-setuptools
)
source=(
  "https://github.com/Breakthrough/DVR-Scan/archive/refs/tags/v$_tag.tar.gz"
  dvr-scan.desktop
  dvr-scan.png
)
sha256sums=('5600916652bf7d5157b0e4f342869aaa782969894a7688052bb5ccf6be5f2fc1'
            'e38e9df2eebc61f343907825c7b9868df8481ed83113c5174ad9c0fb75df7d1d'
            '05a338ae2596fb9e5e9ac686ff3a13454ec00604c8f21443414e2ba8e611fdf8')

package() {
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  install -Dm644 dvr-scan.desktop "$pkgdir/usr/share/applications/dvr-scan.desktop"
  install -Dm644 dvr-scan.png "$pkgdir/usr/share/pixmaps/dvr-scan.png"

  cd "DVR-Scan-$_tag"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

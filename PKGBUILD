# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolero-git
pkgver=0.8.0
pkgrel=1
pkgdesc='Monitor and control your cooling devices.'
arch=('x86_64')
url='https://gitlab.com/codifryed/coolero'
license=('GPL3')
depends=(
  python
  python-poetry
  pyside6
  qt6-svg
  liquidctl
  python-apscheduler
  python-matplotlib
  python-numpy
  python-psutil
  python-setproctitle
  python-jeepney
  python-pyamdgpuinfo
)
makedepends=(
  git
  python-build
  python-installer
)
checkdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$url/-/archive/$pkgver/${pkgname%-git}-$pkgver.tar.gz")
sha256sums=(
  '31dea237415d9a1ddc70a11ab3fbde2f0d662212954268579dcbc2b5c67d86ab'
)

build() {
  cd ${pkgname%-git}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname%-git}
  python -m coolero -h
  python -m coolero -v
}

package() {
  cd ${pkgname%-git}
  python -m installer --destdir="$pkgdir" dist/coolero-$pkgver-*.whl
  install -D -m644 "metadata/org.coolero.Coolero.desktop" "${pkgdir}/usr/share/applications/org.coolero.Coolero.desktop"
  install -D -m644 "metadata/org.coolero.Coolero.png" "$pkgdir/usr/share/pixmaps/org.coolero.Coolero.png"
}

# Maintainer: rugbedbugg <yes.par781@gmail.com>
pkgname=ly-lock
pkgver=0.2.0
pkgrel=1
pkgdesc="Wayland lock screen that looks and behaves like the ly display manager"
arch=('any')
url="https://github.com/rugbedbugg/ly-lock"
license=('WTFPL')
depends=(
  'gtk4'
  'gtk4-layer-shell'
  'kbd'
  'python'
  'python-gobject'
  'python-numpy'
  'python-opengl'
  'python-pam'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=(
  'ly: settings and language files for the lock screen'
  'brightnessctl: F5 and F6 brightness keys'
)
backup=('etc/pam.d/ly-lock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d4043dfcf41513a1d203b309525362fe7f7f95c93722f89afe5679918d49802')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 pam/ly-lock "$pkgdir/etc/pam.d/ly-lock"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

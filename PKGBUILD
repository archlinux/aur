# Maintainer: Dawson Matthews <dawsonwmatthews@proton.me>

pkgname=kde-display-profiles
pkgver=1.0.0
pkgrel=1
pkgdesc="GUI to save and load display profiles using kscreen-doctor"
arch=('any')
url="https://github.com/Dawsani/kde-display-profiles"
license=('MIT')
depends=('python' 'pyside6' 'kscreen')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e161775a605ee74426645b35d686ceb29ac2f700f2833efd5a98602e3d540089')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop file
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

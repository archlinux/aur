# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname='ble-lock-session'
pkgver=1.0.0
pkgrel=1
pkgdesc='Lock and unlock your computer screen using the proximity of a Bluetooth device'
url="https://github.com/azratul/ble-lock-session"
depends=('python')
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'python-coverage'
)
license=('GPL-3.0-or-later')
arch=('any')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname.service"
)
sha256sums=('f5aaf2868c2355ddb9df4626e3400e3a574423980ed144523874eced2910cfc2'
            '0fc54f4a7a0ff7d38a354a9db64e4f8cb7f6390a07212761728986e6c1746c63')

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
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et

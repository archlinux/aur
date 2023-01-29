# Maintainer: Christopher Arndt <chris at chrisarndt.de>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=adafruit-ampy
pkgver=1.1.0
pkgrel=1
pkgdesc='Utility to interact with a CircuitPython or MicroPython board over a serial connection'
url='https://github.com/scientifichackers/ampy'
arch=(any)
license=(MIT)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-click python-pyserial python-dotenv)
provides=(python-ampy ampy)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f4cba36f564096f2aafd173f7fbabb845365cc3bb3f41c37541edf98b58d3976')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # install documentation
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  # install license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:

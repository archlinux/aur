# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=oryx-kb-leds
pkgver=1.1
pkgrel=4
pkgdesc="Control your Oryx Pro's Keyboard LEDs"
arch=('x86_64')
url="https://github.com/davemcphee/oryx-kb-leds"
license=('GPL-3.0-or-later')
depends=('python-colour' 'python-psutil' 'python-pyaml' 'system76-dkms')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d1ebeaf7464147beb3dba36e629b0e0afe5e31c6243cef298998eb2afe240a16')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 systemd/oryxkbleds.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

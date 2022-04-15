# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: YaYPIXXO <viggo@lekdorf.com>
pkgname=evillimiter
pkgver=1.5.0
pkgrel=2
pkgdesc="Tool that monitors, analyzes and limits the bandwidth of devices on the local network without administrative access."
arch=('any')
url="https://github.com/bitbrute/evillimiter"
license=('MIT')
depends=('python-colorama' 'python-netaddr' 'python-netifaces' 'python-tqdm'
         'python-scapy' 'python-terminaltables')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8894b7e0c6df3144abc07babf08d5ba4321895c8f85a52932aaf8adc06c9829')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # Fix LIBC issue
  ln -sf /usr/lib/libc.a "$pkgdir/usr/lib/liblibc.a"
}

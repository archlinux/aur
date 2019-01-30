# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=psrecord
pkgver=1.1
pkgrel=2
pkgdesc="Record and plot the CPU and memory activity of a process."
arch=('any')
url="https://github.com/astrofrog/psrecord"
license=('custom:Simplified BSD')
depends=('python-psutil')
makedepends=('python-pytest' 'python-matplotlib')
optdepends=('python-matplotlib: to generate plots of the data')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrofrog/psrecord/archive/v1.1.tar.gz")
sha256sums=('334ff9d1ef4d8ab7c770b840ccb90b9b0e5c0fd4f8d2679e9cf579cdb8846f6b')

build() {
	cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  pytest psrecord
}

package() {
	cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=psrecord
pkgver=1.2
pkgrel=1
pkgdesc="Record and plot the CPU and memory activity of a process."
arch=('any')
url="https://github.com/astrofrog/psrecord"
license=('BSD')
depends=('python-psutil')
checkdepends=('python-matplotlib')
makedepends=('python-pytest')
optdepends=('python-matplotlib: to generate plots of the data')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrofrog/psrecord/archive/v$pkgver.tar.gz")
b2sums=('c4bf7c0c92030c07273fb76a192fb175e46e448ebdb761d16bf01c01d06183947fe1a76178baaa79d58728dc9b2b1c3793f69f6e7a9fa51b029f9df5e9a521aa')

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

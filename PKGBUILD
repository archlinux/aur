# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=amdfan
pkgdesc="Python daemon for controlling the fans on amdgpu cards"
pkgver=0.1.17
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python' 'python-yaml' 'python-numpy' 'python-rich' 'python-click')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/amdfan"
source=("https://github.com/mcgillij/amdfan/releases/download/$pkgver/amdfan-$pkgver.tar.gz")
md5sums=('d82cf5a366a4faefd48132cafc289f81')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -Dm644 src/amdfan/amdfan.service "$pkgdir/usr/lib/systemd/system/"
}

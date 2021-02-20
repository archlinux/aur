# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=amdfan
pkgdesc="Python daemon for controlling the fans on amdgpu cards"
pkgver=0.1.6
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python' 'python-yaml' 'python-numpy' 'python-rich' 'python-click')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/amdfan"
source=("https://github.com/mcgillij/amdfan/releases/download/0.1.6/amdfan-0.1.6.tar.gz")
md5sums=('c783ff0dbc5cd144dca48b6bf3b66fdd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -Dm644 amdfan/amdfan.service "$pkgdir/usr/lib/systemd/system/"
} 

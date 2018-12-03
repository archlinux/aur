# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>


pkgname=amdgpu-fan
pkgdesc="Python daemon for controlling the fans on amdgpu cards"
pkgver=0.0.1.r0.g0eeaa8e
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python' 'python-yaml' 'python-matplotlib' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
url="https://github.com/chestm007/amdgpu-fan"
source=("git+https://github.com/chestm007/amdgpu-fan/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/amdgpu-fan"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/amdgpu-fan"
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  python setup.py build
}

package() {
  cd "$srcdir/amdgpu-fan"
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp amdgpu-fan.service "$pkgdir/usr/lib/systemd/system/"
} 

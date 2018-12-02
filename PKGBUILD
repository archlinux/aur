# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>


pkgname=linux-thermaltake-rgb
pkgdesc="Python usb daemon and controller for thermaltake rgb watercooling devices"
pkgver=0.0.6.r0.g9fe42c6
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python' 'python-yaml' 'python-gobject' 'python-dbus' 'python-psutil' 'python-pyusb')
makedepends=('python-setuptools')
url="https://github.com/chestm007/linux_thermaltake_riing"
source=("git+https://github.com/chestm007/linux_thermaltake_riing/")
md5sums=('SKIP')

pkgver() {
  cd linux_thermaltake_riing
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/linux_thermaltake_riing/tests"
  nosetests
}

build() {
  cd "$srcdir/linux_thermaltake_riing"
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  python setup.py build
}

package() {
  cd "$srcdir/linux_thermaltake_riing"
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir"
} 

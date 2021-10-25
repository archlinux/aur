# Contributor: sudokode <sudokode@gmail.com>

pkgname=python-netifaces-git
epoch=1
pkgver=0.11.0.r127.53fcdb6
pkgrel=1
pkgdesc="Portable module to access network interface information in Python"
arch=('x86_64')
url="https://alastairs-place.net/netifaces/"
license=('MIT')
provides=('python-netifaces')
conflicts=('python-netifaces')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/al45tair/netifaces")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "0.11.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname

  python setup.py install --root "${pkgdir}" --skip-build

  # Install license, that is inside the readme file
  install -Dm644 README.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

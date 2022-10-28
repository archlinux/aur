# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=plex-remote-git
pkgver=1.0.2.r5.gc29ef95
pkgrel=1
pkgdesc="A library for easy implementing a remote plex client"
arch=('any')
url="https://github.com/tijder/plex-remote"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}

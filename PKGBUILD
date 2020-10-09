# Maintainer: Vidar Magnusson <printit at vidarmagnusson dot com>

pkgname=printit-git
pkgver=v2.0.8.r0.g816953f
pkgrel=1
pkgdesc="Utility for printing at Chalmers University"
arch=("any")
url="https://github.com/viddem/printit"
makedepends=("git" "python-setuptools")
depends=("python>=3" "python-requests" "python-setuptools" "python-pip" "python-click" "python-lxml" "python-paramiko" "python-scp")
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")
license=('AGPL3')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
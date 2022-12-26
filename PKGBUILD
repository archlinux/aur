# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nuitka-git
pkgver=1.3.2.r7.g9a24f7a54
pkgrel=1
pkgdesc="A Python compiler"
arch=('any')
url="https://nuitka.net/"
license=('apache')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=('chrpath: for building standalone executables')
provides=("nuitka=$pkgver")
conflicts=('nuitka')
source=("git+https://github.com/Nuitka/Nuitka.git")
sha256sums=('SKIP')


pkgver() {
  cd "Nuitka"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "Nuitka"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "Nuitka"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
}

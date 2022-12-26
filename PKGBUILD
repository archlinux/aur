# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bloscpack-git
pkgver=0.16.0.r46.g5efdadf
pkgrel=1
pkgdesc="Command line interface to and serialization format for Blosc"
arch=('any')
url="https://github.com/Blosc/bloscpack"
license=('MIT')
depends=('python-blosc' 'python-deprecated' 'python-numpy' 'python-six')
makedepends=('git' 'python-setuptools')
provides=("bloscpack=$pkgver")
conflicts=('bloscpack')
source=("git+https://github.com/Blosc/bloscpack.git")
sha256sums=('SKIP')


pkgver() {
  cd "bloscpack"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bloscpack"

  python "setup.py" build
}

package() {
  cd "bloscpack"

  python "setup.py" install \
    --optimize 1 \
    --root "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bloscpack"
}

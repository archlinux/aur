# Maintainer: Mattia Moffa <mattia@moffa.xyz>

pkgname=virtualbricks-develop-git
pkgver=r2176.e331a0b
pkgrel=1
pkgdesc="Qemu/KVM and VDE frontend (git development branch)"
arch=('any')
url="https://github.com/virtualsquare/virtualbricks"
license=('GPL2')
depends=('python-gobject' 'python-pillow' 'python-pygraphviz' 'python-twisted' 'python-zope-interface' 'vde2' 'qemu-full')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=("vde-netemu-git: channel emulator support")
provides=("virtualbricks=$pkgver")
conflicts=("virtualbricks")
source=('virtualbricks::git+https://github.com/virtualsquare/virtualbricks.git#branch=develop')
sha256sums=('SKIP')

pkgver() {
  cd virtualbricks
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd virtualbricks
  #patch --strip=1 --input="${srcdir}/virtualbricks.patch"
}

build() {
  cd virtualbricks
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="$pkgdir" virtualbricks/dist/*.whl
}

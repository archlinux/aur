# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

_pkgname=python-btrfs
pkgname=python-btrfs-git
pkgver=13.r6.g59c8dac
pkgrel=1
pkgdesc="Python Btrfs module"
arch=('any')
url="https://github.com/knorrie/python-btrfs"
license=('LGPL3')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-btrfs')
conflicts=('python-btrfs')
source=("git+https://github.com/knorrie/python-btrfs.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
    cd python-btrfs
    git describe --long --tags | sed -r 's|^v||;s|-|.r|;s|-|.|g'
}

build() {
    cd python-btrfs
    python -m build --wheel --no-isolation
}

package() {
    cd python-btrfs
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 bin/btrfs-* -t "$pkgdir/usr/bin"
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 examples/*.py -t "$pkgdir/usr/share/doc/$_pkgname/examples"
    # docs?
}

# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

_pkgname=python-btrfs
pkgname=python-btrfs-git
pkgver=12.r3.ga4f7697
pkgrel=1
pkgdesc="Python Btrfs module"
arch=('any')
url="https://github.com/knorrie/python-btrfs"
license=('LGPL3')
depends=('python')
makedepends=('git')
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
    python setup.py build
}

package() {
    cd python-btrfs
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
    install -Dm755 bin/btrfs-* -t "$pkgdir/usr/bin"
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 examples/*.py -t "$pkgdir/usr/share/doc/$_pkgname/examples"
    # docs?
}

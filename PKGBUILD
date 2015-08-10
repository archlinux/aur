# Contributor: Oliver Mangold <o.mangold@gmail.com>
# Maintainer: TheNiceGuy <gabrielpolloguilbert@gmail.com>

pkgname=bedup
pkgver=0.9.0
pkgrel=5
pkgdesc="Offline deduplication utility for the BTRFS filesystem"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'python-distribute' 'python-alembic' 'python-sqlalchemy'
         'python-cffi' 'python-xdg' 'python-mako')
makedepends=('gcc' 'btrfs-progs')
url="https://github.com/g2p/bedup"
conflicts=('vpaint-git')
provides=()
source=('https://pypi.python.org/packages/source/b/bedup/bedup-0.9.0.tar.gz'
        'bedup-contextlib2.patch'
        'bedup-update-current-rev.patch')
md5sums=('7b743397e2186e2540a83c857185c28a'
         '1795a0ececd0c06ecbf22b0845ba34bb'
         'f5eb55bdd4416aac5ae42be771a81c93')
conflicts=('bedup-git')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -p1 -i "$srcdir/bedup-contextlib2.patch"
    patch -p1 -i "$srcdir/bedup-update-current-rev.patch"

    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python setup.py install --root "$pkgdir"
}

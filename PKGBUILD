# Maintainer: Alad Wenter <alad@archlinux.org>
pkgname=kittypack
pkgver=0.2.1
pkgrel=1
pkgdesc="Query package information from archweb API"
arch=('any')
url="https://github.com/MrElendig/kittypack"
license=('AGPL3')
depends=('python-requests' 'python-docopt' 'python-yaml'
         'python-curtsies' 'python-setuptools')
makedepends=('python-docutils')
backup=('etc/kittypack.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c35503c642d0b9394b9d16e572633073063794cbcc66bffbe114c7ce6398d6f6')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build

    cd doc/man
    rst2man kittypack.1.rst kittypack.1
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    install -D doc/man/kittypack.1 "$pkgdir"/usr/share/man/man1/kittypack.1
    install -D kittypack/kittypack.conf "$pkgdir"/etc/kittypack.conf
}

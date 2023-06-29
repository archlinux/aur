# Maintainer: Alad Wenter <alad@archlinux.org>
pkgname=kittypack
pkgver=0.2.4
pkgrel=2
pkgdesc="Query package information from archweb API"
arch=('any')
url="https://github.com/MrElendig/kittypack"
license=('AGPL3')
depends=('python-requests' 'python-click' 'python-yaml' 'python-setuptools')
conflicts=('kittypack-git')
makedepends=('python-docutils')
backup=('etc/kittypack.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f9e5fea9dc10a60ef285aecffb43b92baa9174978238aefa61552d1e92cc5ca5')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build

    cd doc/man
    rst2man kittypack.1.rst kittypack.1
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -D doc/man/kittypack.1 "$pkgdir"/usr/share/man/man1/kittypack.1
    install -D kittypack/kittypack.conf "$pkgdir"/etc/kittypack.conf
}

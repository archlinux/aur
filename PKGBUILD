# Maintainer: Rafael Silva <silvagracarafael@gmail.com>

pkgname=vizex
pkgver=2.0.3
pkgrel=2
pkgdesc="vizex is the terminal program for the UNIX/Linux systems which helps the user to visualize the disk space usage for every partition and media on the user's machine."
arch=('any')
url="https://github.com/bexxmodd/vizex"
license=('MIT')
depends=('python-click' 'python-colored' 'python-pandas' 'python-psutil'
         'python-magic' 'python-tabulate')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bexxmodd/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f88d4c99e591dcb6e14a921d9fca4105091568567c19db71cb032421f603a261')

prepare() {
    cd "$pkgname-$pkgver"

    # Rename module
    find . -type f -exec sed -i "s|main|$pkgname|g" {} \;
    mv main "$pkgname"
}

build() {
    cd "$pkgname-$pkgver"

    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

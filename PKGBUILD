# Maintainer: Rafael Silva <silvagracarafael@gmail.com>

pkgname=vizex
pkgver=1.9.9
pkgrel=2
pkgdesc="vizex is the terminal program for the UNIX/Linux systems which helps the user to visualize the disk space usage for every partition and media on the user's machine."
arch=('any')
url="https://github.com/bexxmodd/vizex"
license=('MIT')
depends=('python-click' 'python-colored' 'python-pandas' 'python-psutil'
         'python-magic' 'python-tabulate')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bexxmodd/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e809d47bcff585beb76d75f134b1b1c4f46ea49f31b349e1f0f0818991ee5077')

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

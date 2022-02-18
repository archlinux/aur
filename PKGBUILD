# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=python-barcode-git
_pkgname=python_barcode
pkgver=v0.13.1.r90.g51a7a9f
pkgrel=1
pkgdesc="Create standard barcodes with Python. No external modules needed. (git version)"
arch=('any')
license=('MIT')
conflicts=('python-barcode')
provides=('python-barcode')
url="https://github.com/WhyNotHugo/python-barcode"
depends=('python')
optdepends=('python-pillow: generate images')
makedepends=('python-setuptools' 'python-pip' 'git')
source=(
        "$pkgname::git+https://github.com/WhyNotHugo/python-barcode.git"
    )
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
}


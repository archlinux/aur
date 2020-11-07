# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-ccsyspath
pkgver=1.1.0
pkgrel=1
pkgdesc="Find the system include paths for clang and gcc based c/c++ compilers"
arch=('x86_64')
url="https://github.com/AndrewWalker/ccsyspath"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/44/78/e9889190cfeff0c43e4435c3fb178ed2a9bf110e0ca74c5df065cc29af0d/ccsyspath-${pkgver}.tar.gz")
sha256sums=('e081170c7e1841af640b70c21dba697e9a7306cf8f318f57e298b6435879b6e7')

build() {
    cd "$srcdir/ccsyspath-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/ccsyspath-$pkgver"
    python setup.py install \
        --prefix=/usr \
        --root="$pkgdir" \
        --optimize=1 \
        --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "$pkgdir/usr/lib/python3.8/site-packages/tests"
}

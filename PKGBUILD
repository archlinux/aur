# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.1.0
pkgrel=4
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("python" "python-pkgconfig" "python-psutil" "python-virtualenv")  # python-pyxdg
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "xdg.patch")
sha256sums=('704b9e4ec0594f84ef6a29d3caca4c74ee9778ec57ab97c5bd79073e477982c2'
            '5eeea55f3c7c216fbf04368936005da618f49c57f75bda66e8e3d15772d17a87')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # fix issue with xdg/pyxdg https://bugs.archlinux.org/task/64173
    patch --forward --strip=1 --input="${srcdir}/xdg.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}


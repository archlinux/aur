# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.1.0
pkgrel=3
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("python" "python-pkgconfig" "python-psutil" "python-virtualenv")  # python-xdg
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "xdg.py::https://github.com/srstevenson/xdg/raw/4.0.1/src/xdg/__init__.py")
sha256sums=('704b9e4ec0594f84ef6a29d3caca4c74ee9778ec57ab97c5bd79073e477982c2'
            '8be0fdce34525e68d18dc3df8297a1672551bdae4b8dfab6d0eb6ee7be1e0f0e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    # temporary fix issue with xdg/pyxdg https://bugs.archlinux.org/task/64173
    install -m 0644 "$srcdir/xdg.py" "$pkgdir/usr/lib/python3.8/site-packages/virtualfish/loader/xdg.py"
}


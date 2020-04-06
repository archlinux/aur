# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.1.0
pkgrel=2
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("python" "python-pkgconfig" "python-psutil" "python-virtualenv")  # python-xdg
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "xdg.py::https://github.com/srstevenson/xdg/blob/4.0.1/src/xdg/__init__.py")
sha256sums=('704b9e4ec0594f84ef6a29d3caca4c74ee9778ec57ab97c5bd79073e477982c2'
            '993c0f93619481ba0d673d7c22c5e14ea6c8a15da27147d07dbc35ae14680c15')

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


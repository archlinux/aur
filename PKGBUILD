# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>

pkgname=sailboot
pkgver=1.0
pkgrel=1
pkgdesc="Highly customizable framework for performing numerical bootstrap computations"
arch=(any)
url='https://gitlab.com/maneandrea/sailboot'
license=('GPL')
depends=('python-mpmath' 'python-pyparsing' 'sdpb-git')
optdepends=('python-gmpy2' 'sagemath' 'scalar_blocks-git')
makedepends=('python-setuptools')
source=('https://gitlab.com/maneandrea/sailboot/-/archive/v1.0/sailboot-v1.0.tar.gz')
sha256sums=('fcac6a42c2220220737d1274ec86afb2a33488737fb2a81d8ec3e8526b272bc7')

build() {
    cd "$pkgname"-v"$pkgver"

    python setup.py build
}

package() {
    cd "$pkgname"-v"$pkgver"

    python setup.py install --root "$pkgdir" --optimize=1

    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

    _pyver=$(python -V | sed -e 's/Python \([0-9]\.[0-9]\+\)\..*/\1/')

    ln -sf /usr/lib/python$_pyver/site-packages/sailboot/main.py "$pkgdir"/usr/bin/sailboot
    ln -sf /usr/lib/python$_pyver/site-packages/sailboot/launch.py "$pkgdir"/usr/bin/launch
    ln -sf /usr/lib/python$_pyver/site-packages/sailboot/monitor.py "$pkgdir"/usr/bin/monitor
}


# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>

pkgname=sailboot
pkgver=1.1
pkgrel=1
pkgdesc="Highly customizable framework for performing numerical bootstrap computations"
arch=(any)
url='https://gitlab.com/maneandrea/sailboot'
license=('GPL')
depends=('python-mpmath' 'python-pyparsing' 'sdpb-git')
optdepends=('python-gmpy2' 'sagemath' 'scalar_blocks-git' 'python-sympy')
makedepends=('python-setuptools')
source=('https://gitlab.com/maneandrea/sailboot/-/archive/v1.1/sailboot-v1.1.tar.gz')
sha256sums=('f024743e49296c23db48621e215ff9e979188e9d80d7cd30b5139cace90afaab')

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


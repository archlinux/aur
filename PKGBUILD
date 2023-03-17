# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>

pkgname=sailboot
pkgver=1.2
pkgrel=1
pkgdesc="Highly customizable framework for performing numerical bootstrap computations"
arch=(any)
url='https://gitlab.com/maneandrea/sailboot'
license=('GPL')
depends=('python-mpmath' 'python-pyparsing' 'sdpb-git')
optdepends=('python-gmpy2' 'sagemath' 'scalar_blocks-git' 'python-sympy')
makedepends=('python-setuptools')
source=('https://gitlab.com/maneandrea/sailboot/-/archive/v1.2/sailboot-v1.2.tar.gz')
sha256sums=('073d13356e4c4a511c65eeef509a31930d8bca8bd60bcb5373279d6fa46499b3')

build() {
    cd "$pkgname"-v"$pkgver"

    python setup.py build
}

package() {
    cd "$pkgname"-v"$pkgver"

    python setup.py install --root "$pkgdir" --optimize=1

    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

    _pyver=$(python -V | sed -e 's/Python \([0-9]\.[0-9]\+\)\..*/\1/')

    ln -sf /usr/lib/python$_pyver/site-packages/sailboot/sailboot.py "$pkgdir"/usr/bin/sailboot
    ln -sf /usr/lib/python$_pyver/site-packages/sailboot/launch.py "$pkgdir"/usr/bin/launch
    ln -sf /usr/lib/python$_pyver/site-packages/sailboot/monitor.py "$pkgdir"/usr/bin/monitor
    ln -sf /usr/lib/python$_pyver/site-packages/sailboot/grid_evaluate.py "$pkgdir"/usr/bin/grid_evaluate
}


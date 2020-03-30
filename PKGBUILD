# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_pkgname=pyxelate
pkgname=python-$_pkgname
pkgver=1.1.4
pkgrel=1
pkgdesc="A Python class that downsamples images into 8-bit pixel arts"
arch=('any')
url="https://github.com/sedthh/pyxelate"
license=('MIT')
depends=('python-scikit-image' 'python-scikit-learn')
makedepends=('git' 'python-setuptools')
source=("git+$url#commit=d9b7a2a556c65807261d54445eb7dca02d30d97d")
sha256sums=('SKIP')

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    mkdir -p "$pkgdir/usr/bin"
    ln -rs "$pkgdir/$(python -c "import site; print(site.getsitepackages()[0])")/pyx.py" \
        "$pkgdir/usr/bin/pyx"
    chmod 755 "$pkgdir/usr/bin/pyx"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

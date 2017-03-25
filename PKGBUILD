# Maintainer: Carl George < arch at cgtx dot us >

_name="pdir2"
_module="${_name%2}"

pkgname=("python-$_module" "python2-$_module")
pkgver=0.1.3
pkgrel=1
pkgdesc="Pretty dir printing with joy"
arch=("any")
url="https://github.com/laike9m/$_name"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8758291948b4264754390b6a9f4f033afd6fc7e9b181a7dd555b21f99b16d77e')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-pdir() {
    depends=("python-colorama")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-pdir() {
    depends=("python2-colorama" "python2-enum34")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

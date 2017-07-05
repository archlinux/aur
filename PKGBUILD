# Maintainer: Carl George < arch at cgtx dot us >

_name="pdir2"
_module="${_name%2}"

pkgname=("python-$_module" "python2-$_module")
pkgver=0.2.1
pkgrel=1
pkgdesc="Pretty dir printing with joy"
arch=("any")
url="https://github.com/laike9m/$_name"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('baaf07033f71efddb1d1d8f63c4b3a3e66415ed91fb4f8895e746c0cc5c89238')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-pdir() {
    depends=("python")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-pdir() {
    depends=("python2" "python2-enum34")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

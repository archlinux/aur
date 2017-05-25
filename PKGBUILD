# Maintainer: Carl George < arch at cgtx dot us >

_name="gitdb2"
_module="${_name%2}"

pkgname=("python-$_name" "python2-$_name")
pkgver="2.0.0"
pkgrel="3"
pkgdesc="a pure-Python git object database"
arch=("any")
url="https://github.com/gitpython-developers/$_module"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b9f3209b401b8b4da5f94966c9c17650e66b7474ee5cd2dde5d983d1fba3ab66')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-gitdb2() {
    depends=("python-smmap2>=2.0.0")
    conflicts=("python-gitdb")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-gitdb2() {
    depends=("python2-smmap2>=2.0.0")
    conflicts=("python2-gitdb")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

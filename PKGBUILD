# Maintainer: Pochang Chen <johnchen902@gmail.com>

pkgbase=python-nclib
pkgname=(python-nclib python2-nclib)
_name=nclib
pkgver=0.8.1
pkgrel=2
pkgdesc="Netcat as a library: convienent socket interfaces"
license=("MIT")
arch=('any')
url="https://pypi.python.org/pypi/nclib/0.8.1"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('4b664281fcb6ba8dff77f3e5d8962f13')
sha512sums=('a3cc23733773ef25856de79a008758547590b0084d27ce2a6a04b846a4bf769be51363deb8e4a75d4ad30dfb2667dd09c6ead19e1cd1bc3c7becee62d1109782')

prepare() {
    cp -a nclib-$pkgver{,-py2}
}

build() {
	cd "$srcdir"/nclib-$pkgver
    python setup.py build
	cd "$srcdir"/nclib-$pkgver-py2
    python2 setup.py build
}

check() {
	cd "$srcdir"/nclib-$pkgver
    python setup.py test
	cd "$srcdir"/nclib-$pkgver-py2
    python2 setup.py test
}

package_python-nclib() {
    depends=('python')
    cd nclib-$pkgver
    python setup.py install -O1 --root="$pkgdir"
    # install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-nclib() {
    depends=('python2')
    cd nclib-$pkgver-py2
    python2 setup.py install -O1 --root="$pkgdir"
    for file in "$pkgdir"/usr/bin/*; do
        mv "$file" "$file"2
    done
    # install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

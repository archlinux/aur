# Maintainer: Pochang Chen <johnchen902@gmail.com>

pkgbase=python-nclib
pkgname=(python-nclib python2-nclib)
_name=nclib
pkgver=0.8.0
pkgrel=2
pkgdesc="Netcat as a library: convienent socket interfaces"
license=("MIT")
arch=('any')
url="https://pypi.python.org/pypi/nclib/0.8.0"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('d3f3f622eefe4c7cdd793661a47b4668')
sha512sums=('8d303d68ecee82b1a015d80edff87707b48d6b75483a527c8557994a8d795d581f9aef617d3ea6e17452d8495341f1b22f2228bc73a80da459d9c820aff3418c')

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

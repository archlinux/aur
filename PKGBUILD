# former Maintainer python-dill: Antony Lee
# former Maintainer python2-dill: bchretien

# Please note: These 2 packages conflict, since both
# aim to install /usr/bin/{get_objgraph,unpickle}.py.
# This is not generically resolvable, these packages
# are thus marked as mutually conflicting.
# If you need to install both, you have to choose which
# package is to provide said programs (difference in
# shebang only!). To do that edit the last lines of each
# package function accordingly.

pkgname=("python-dill" "python2-dill")
pkgbase=python-dill
pkgver=0.2.5
pkgrel=2
pkgdesc='Serialize all of python (almost)'
arch=('any')
url='http://pypi.python.org/pypi/dill/'
license=('BSD')
source=("http://pypi.python.org/packages/source/d/dill/dill-$pkgver.tgz")
md5sums=('5b0c312f034914be2e230457747d9b6c')

build() {
    cd "$srcdir/dill-$pkgver"
    python setup.py build
}

package_python-dill() {
    depends=('python')
    cd "$srcdir/dill-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # edit to resolve conflict
    conflicts=('python2-dill')
    #rm "$pkgdir/usr/bin/get_objgraph.py" "$pkgdir/usr/bin/unpickle.py"
}

package_python2-dill() {
    depends=('python2')
    cd "$srcdir/dill-$pkgver"
    find . -name "*.py" -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#' {} \;
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # edit to resolve conflict
    conflicts=('python-dill')
    #rm "$pkgdir/usr/bin/get_objgraph.py" "$pkgdir/usr/bin/unpickle.py"
}

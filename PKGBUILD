# former Maintainer python-dill: Antony Lee
# former Maintainer python2-dill: bchretien

pkgname=("python-dill" "python2-dill")
pkgbase=python-dill
pkgver=0.2.5
pkgrel=3
pkgdesc='Serialize all of python (almost)'
arch=('any')
url='http://pypi.python.org/pypi/dill/'
license=('BSD')
source=("http://pypi.python.org/packages/source/d/dill/dill-$pkgver.tgz" "python2-dill.install")
md5sums=('5b0c312f034914be2e230457747d9b6c'
         '03858fb53bf5ae72e3f39f4346c9e40f')

build() {
    cd "$srcdir/dill-$pkgver"
    python setup.py build
}

package_python-dill() {
    depends=('python')
    cd "$srcdir/dill-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-dill() {
    depends=('python2')
    install=python2-dill.install
    cd "$srcdir/dill-$pkgver"
    find . -name "*.py" -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#' {} \;
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mv "$pkgdir/usr/bin/get_objgraph.py" "$pkgdir/usr/bin/get_objgraph2.py"
    mv "$pkgdir/usr/bin/unpickle.py" "$pkgdir/usr/bin/unpickle2.py"
}

# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name=uncompyle6
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=3.2.1
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e4b31b1234d6a6068061942c9e67dbbf4eb709b0055a85c10b320aed6c0f7117')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package_python-uncompyle6() {
    depends=('python-spark-parser>=1.8.5' 'python-spark-parser<1.9.0' 'python-xdis>=3.8.2' 'python-xdis<3.9.0' 'python-six')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir"
}

package_python2-uncompyle6() {
    depends=('python2-spark-parser>=1.8.5' 'python2-spark-parser<1.9.0' 'python2-xdis>=3.8.2' 'python2-xdis<3.9.0' 'python2-six')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir"
    mv "$pkgdir/usr/bin/uncompyle6" "$pkgdir/usr/bin/uncompyle62"
    mv "$pkgdir/usr/bin/pydisassemble" "$pkgdir/usr/bin/pydisassemble2"
}

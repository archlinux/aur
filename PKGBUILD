# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name='xdis'
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=3.9.1
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b95337ee772ade4f8038a100f06aaf5ab9e975170fe9afafc9bd29964bc8cc42')

package_python-xdis() {
    depends=('python-click' 'python-six>=1.10.0')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    # Temporary patch
    mv "$pkgdir/usr/bin/pydisasm.py" "$pkgdir/usr/bin/pydisasm"
    sed -i '1i#!/usr/bin/python' "$pkgdir/usr/bin/pydisasm"
}

package_python2-xdis() {
    depends=('python2-click' 'python2-six>=1.10.0')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    # Temporary patch
    mv "$pkgdir/usr/bin/pydisasm.py" "$pkgdir/usr/bin/pydisasm2"
    sed -i '1i#!/usr/bin/python2' "$pkgdir/usr/bin/pydisasm2"
}

# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name='xdis'
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=4.1.2
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0f72c0aeced7090e5f19b840ac58fa76a4761a072fd7a60121ec5eaf578bedad')

package_python-xdis() {
    depends=('python-click' 'python-six>=1.10.0')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    sed -i '1i#!/usr/bin/python' "$pkgdir/usr/bin/pydisasm"
}

package_python2-xdis() {
    depends=('python2-click' 'python2-six>=1.10.0')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/pydisasm" "$pkgdir/usr/bin/pydisasm2"
    sed -i '1i#!/usr/bin/python2' "$pkgdir/usr/bin/pydisasm2"
}

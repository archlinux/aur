# $Id: PKGBUILD 141037 2015-09-19 17:15:34Z foutrelis $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=python-webassets
pkgname=(python2-webassets python-webassets)
_pipname=webassets
pkgver=0.11.1
pkgrel=2
pkgdesc="Media asset management for Python, with glue code for various web frameworks."
arch=(any)
url="http://github.com/miracle2k/webassets/"
license=(BSD)
makedepends=(python2-django python-django python2-setuptools python-setuptools)
source=("http://pypi.python.org/packages/source/w/${_pipname}/${_pipname}-${pkgver}.tar.gz")
md5sums=('6acca51bd12fbdc0399ab1a9b67a1599')

prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-webassets() {
depends=(python2-django)
optdepends=('python2-pillow: support for image manipulation'
            'python2-nose: required to run tests'
            'python2-mock: required to run tests')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -i "$pkgdir"/usr/lib/python2.7/site-packages/webassets/filter/rjsmin/rjsmin.py

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-webassets() {
depends=(python-django)
optdepends=('python-pillow: support for image manipulation'
            'python-nose: required to run tests'
            'python-mock: required to run tests')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

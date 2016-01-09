# Maintainer: Brice Waegeneire <bricewge at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Carl George < arch at cgtx dot us >

pkgbase=python-click
pkgname=("python-click-5.1" "python2-click-5.1")
_realname=click
pkgver=5.1
pkgrel=1
pkgdesc="A simple wrapper around optparse for powerful command line utilities"
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
provides=("python-click" "python2-click")
conflicts=("python-click" "python2-click")
source=("https://pypi.python.org/packages/source/c/$_realname/$_realname-$pkgver.tar.gz")
sha256sums=('678c98275431fad324275dec63791e4a17558b40e5a110e20a82866139a85a5a')

prepare() {
    cp -a $_realname-$pkgver{,-python2}
}

build() {
    cd "${srcdir}/${_realname}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_realname}-${pkgver}-python2"
    python2 setup.py build
}

package_python-click-5.1() {
    depends=("python")
    cd "${srcdir}/${_realname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click-5.1() {
    depends=("python2")
    cd "${srcdir}/${_realname}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-easywebdav' 'python2-easywebdav')
pkgver=1.2.0
pkgrel=4
pkgdesc="A straight-forward WebDAV client, implemented using Requests"
arch=('any')
url="https://pypi.python.org/pypi/easywebdav"
license=('custom:ISC')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/a7/de/fe77955c0a389da729ac113c5ad2c11e521e8392868531abde28d411f2ab/easywebdav-${pkgver}.tar.gz"
        "LICENSE")
sha512sums=('f5c077f12625a2bc919032ff02f72ede2b53f8850304cd70d69bf10ce5103991570b2d4bce76ca77f5fba91b959ad206004fbbc8d1d25391439e78999df84f19'
            '34efbcffa986b9aa33c50275c3a9887052b89dc5e3556ac30db8e74f0575f6092de7853f43aef788eaebf669f076fb0cfbdae066c1858a65d3ebef6ef38dbd1b')
makedepends=('python-setuptools' 'python2-setuptools')


prepare() {
  cp -a easywebdav-$pkgver{,-py2}
  cd "$srcdir/easywebdav-$pkgver"
  sed -i 's/basestring/str/g' easywebdav/client.py
}

build() {
    cd "$srcdir/easywebdav-$pkgver"
    python setup.py build
 
    cd "$srcdir/easywebdav-$pkgver-py2"
    python2 setup.py build
}
 
package_python-easywebdav() {
    depends=("python-requests")
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "$srcdir/easywebdav-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
 
package_python2-easywebdav() {
    depends=("python2-requests")
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "$srcdir/easywebdav-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

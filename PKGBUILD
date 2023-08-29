# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-easywebdav')
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=5
pkgdesc="A straight-forward WebDAV client, implemented using Requests"
arch=('any')
url="https://pypi.python.org/pypi/easywebdav"
license=('custom:ISC')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE")
sha512sums=('f5c077f12625a2bc919032ff02f72ede2b53f8850304cd70d69bf10ce5103991570b2d4bce76ca77f5fba91b959ad206004fbbc8d1d25391439e78999df84f19'
            '34efbcffa986b9aa33c50275c3a9887052b89dc5e3556ac30db8e74f0575f6092de7853f43aef788eaebf669f076fb0cfbdae066c1858a65d3ebef6ef38dbd1b')

makedepends=(python-build python-installer python-wheel python-setuptools)
depends=("python-requests")

prepare() {
  cd "$_name-$pkgver"
  sed -i 's/basestring/str/g' easywebdav/client.py
}
 
build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

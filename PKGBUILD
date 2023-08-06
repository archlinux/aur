# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

pkgname="python-upnpclient"
pkgver=1.0.3
pkgrel=1
pkgdesc="Python 3 library for accessing uPnP devices."
arch=("any")
url="https://github.com/flyte/upnpclient"
license=("MIT")
_pydeps=("requests" "six" "dateutil" "lxml" "ifaddr")
depends=("python" ${_pydeps[@]/#/python-})
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/dd/69/4d38d9fa757c328df93e7037eb8c1da8ca48e62828c23ba3c421e9335e30/upnpclient-${pkgver}.tar.gz")
sha256sums=("641f05fa4b8e5c5b5cc4561dab49fe5c4774d26e51378671efad4023249e69b8")
_srcname="upnpclient-${pkgver}"

build() {
    cd "${srcdir}/${_srcname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_srcname}"
    python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
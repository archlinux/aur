# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python2-tldextract
pkgver=2.0.2
pkgrel=1
pkgdesc="Accurately separate the TLD from the registered domain andsubdomains of a URL, using the Public Suffix List."
arch=("any")
url="https://github.com/john-kurkowski/tldextract"
license=("BSD")
depends=("python2" "python2-idna" "python2-requests" "python2-requests-file")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/44/db/ab27d3003968f766bff7bde238de418d2b8ddd727c3e56346ffd3ef05e27/tldextract-${pkgver}.tar.gz")
md5sums=("bcc6a198864f9c86ffdd8014fa3ccd73")

build() {
    cd "tldextract-${pkgver}"
    python2 setup.py build
}

package() {
    cd "tldextract-${pkgver}"
    python2 setup.py install --root=${pkgdir} --optimize=1 --skip-build
    # Avoid conflict with the python3 version
    mv "${pkgdir}/usr/bin/tldextract" "${pkgdir}/usr/bin/py2-tldextract"
}

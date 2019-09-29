# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=weboob
pkgname=weboob-headless-git
pkgver=1.5.r753.g695976f8c
pkgrel=1
pkgdesc="Web Out Of Browsers provides several applications to interact with a lot of websites. Headless version, for use in e.g. Cozy/Kresus."
arch=(any)
url="http://weboob.org/"
license=(GPL)
depends=(python-dateutil
         python-feedparser
         python-lxml
         python-prettytable
         python-requests
         python-cssselect
         python-html2text
         python-unidecode
         python-pillow
         python-simplejson
         python-yaml
         python-google-api-python-client
         python-mechanize)
makedepends=(python-setuptools git)
conflicts=(weboob weboob-git)
provides=(weboob weboob-git)
source=(git+https://git.weboob.org/weboob/weboob.git)
sha256sums=(SKIP)

pkgver() {
    cd ${_pkgname}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}
    python setup.py build --no-qt
}

package() {
    cd ${_pkgname}
    python setup.py install --no-xdg --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}

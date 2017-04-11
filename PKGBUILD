# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=weboob
pkgname=weboob-headless-git
pkgver=1.2.r513.g81bfbe368
pkgrel=1
pkgdesc="Web Out Of Browsers provides several applications to interact with a lot of websites. Headless version, for use in e.g. Cozy/Kresus."
arch=('any')
url="http://weboob.org/"
license=('GPL')
depends=('python2-dateutil'
         'python2-feedparser'
         'python2-lxml'
         'python2-prettytable'
         'python2-requests'
#         'python2-cssselect'
#         'python2-html2text'
         'python2-pillow'
         'python2-simplejson'
         'python2-yaml'
         'python2-mechanize'
         'python2-gdata'
         'python2-futures')
makedepends=('python2-setuptools' 'git')
conflicts=('weboob')
provides=('weboob')
source=(${_pkgname}::'git+https://git.weboob.org/weboob/devel.git')
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}
    python2 setup.py build --no-qt --no-hildon
}

package() {
    cd ${_pkgname}
    python2 setup.py install --no-xdg --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}

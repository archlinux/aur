# Maintener: sputnick <gilles *DOT* quenot *AT* gmail *DOT* com>
# Contributor: ianux <ianux@free.fr>

pkgname=weboob-git
pkgver=1.3_1963_g118abef9e
pkgrel=1
pkgdesc="Weboob (Web Out Of Browsers) provides several applications to interact with a lot of websites."
url="http://weboob.org"
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h')
depends=(
    phonon-qt5
    python2-cssselect
    python2-dateutil
    python2-feedparser
    python2-futures
    python2-google-api-python-client
    python2-html2text
    python2-imaging
    python2-lxml
    python2-mechanize
    python2-prettytable
    python2-pyqt5
    python2-pysqlite
    python2-requests
    python2-simplejson
    python2-unidecode
    python2-yaml
    which
)
makedepends=(git python2-distribute python2-setuptools make)
optdepends=('gnupg: check for repository authenticity'
            'python2-routes: contrib backends'
            'python2-webob: contrib backends'
            'python2-mako: contrib backends'
            'pywebkitgtk: contrib backends'
            'python2-pillow: PIL replacement'
            'python2-termcolor: color formatting'
            'python2-nose: test suite')
conflicts=('weboob')
provides=('weboob')
source=("$pkgname"::'git+https://git.weboob.org/weboob/devel')
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    local ver="$(git describe --long)"
    printf "%s" "${ver//-/.}"
}

package() {
   cd ${srcdir}/${pkgname}
   python2 setup.py install --qt --xdg --prefix=/usr --root="$pkgdir"
   install -Dm 644 tools/weboob_bash_completion "$pkgdir/etc/bash_completion.d/weboob"
}


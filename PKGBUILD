# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: sputnick <gilles *DOT* quenot *AT* gmail *DOT* com>
# Contributor: ianux <ianux@free.fr>

pkgname=weboob-git
pkgver=2.0.r492.gea2752d36
pkgrel=1
pkgdesc="Core library and modules for Web Outside of Browsers"
arch=(any)
url="https://weboob.org"
license=('LGPL3')
depends=('python-lxml'
         'python-cssselect'
         'python-requests'
         'python-dateutil'
         'python-yaml'
         'python-html2text'
         'python-six'
         'python-unidecode'
         'python-pillow'
         'python-babel'
         'python-simplejson')
optdepends=('python-prettytable: CLI output formatting'
        'python-feedparser: required by some modules')
makedepends=('python-setuptools' 'git')
replaces=('weboob-headless')
provides=('weboob-headless')
conflicts=('weboob-headless')
source=("weboob::git+https://git.weboob.org/weboob/weboob")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/weboob"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/weboob"
  python setup.py build
}

package() {
  cd "${srcdir}/weboob"
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
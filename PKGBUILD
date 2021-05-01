# Maintainer:  Louise Zanier
# Contributor: sputnick <gilles *DOT* quenot *AT* gmail *DOT* com>
# Contributor: ianux <ianux@free.fr>

pkgname=weboob-git
pkgver=3.0.r73.gfd7610aaa
pkgrel=1
pkgdesc="Core library and modules for Web Outside of Browsers"
arch=(any)
url="https://woob.tech"
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
source=("git+https://gitlab.com/woob/woob")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/woob"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/woob"
  python setup.py build
}

package() {
  cd "${srcdir}/woob"
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}

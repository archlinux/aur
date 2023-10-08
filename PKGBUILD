# Maintainer: Filipp Andjelo <filipp.andjelo@gmail.com>

pkgname=gourmet-git
_pkgname=gourmet
pkgver=0.17.4.r604.g8af29c8
provides=('gourmet')
conflicts=('gourmet')
pkgdesc='Manager, editor, and organizer for recipes'
url='https://github.com/thinkle/gourmet'
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python' 'python-argcomplete' 'python-beautifulsoup4' 'python-lxml' 
         'python-pillow' 'python-cairo' 'python-gobject' 'python-pyenchant'
         'python-keyring' 'python-reportlab' 'python-requests' 'python-toml' 
         'python-sqlalchemy1.3')
optdepends=(
    'python-ebooklib: epub plugin'
    'python-gtkspellcheck: spellcheck plugin'
    'python-scrape-schema-recipe: web import plugins'
)
makedepends=('python-setuptools' 'intltool')
source=('git+https://github.com/thinkle/gourmet.git')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  python setup.py build_i18n
}

package() {
  cd ${_pkgname}
  python setup.py install --root=${pkgdir}
  install -Dm644 gourmet.desktop -t ${pkgdir}/usr/share/applications
}

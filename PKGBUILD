# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=remhind-git
pkgver=21.25f6e83
pkgrel=1
pkgdesc='A notification daemon of events stored in directories'
arch=('any')
url='https://github.com/nicoe/remhind'
license=('GPL3')
depends=('python' 'python-aionotify' 'python-icalendar' 'python-dateutil' 'python-pyinotify'
          'python-gobject' 'python-toml' 'python-tzlocal' 'python-pyxdg')
makedepends=('python-setuptools' 'python-pytest')
checkdepends=('python-freezegun')
source=("git+https://github.com/nicoe/remhind")
b2sums=('SKIP')

pkgver() {
  cd remhind
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd remhind
  python setup.py build
}

check() {
  cd remhind
  python -m pytest
}

package() {
  cd remhind
  NO_THIRD_PARTY=true python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

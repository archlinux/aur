_reponame=ldoce5viewer
pkgname="${_reponame}-git"
pkgver=r43.8004fb9
pkgrel=1
pkgdesc="Fast dictionary viewer for the Longman Dictionary of Contemporary English (LDOCE) 5th Edition"
url="http://hakidame.net/ldoce5viewer/"
license=(GPL3)
arch=('any')
depends=(git python-pyqt4 python-lxml gstreamer0.10-python gstreamer0.10-good-plugins gstreamer0.10-ugly-plugins python-whoosh phonon-qt4)
install="${_reponame}"-git.install
source=("git://github.com/ciscorn/ldoce5viewer.git" "whoosh2.7.patch")
sha512sums=('SKIP' "SKIP")

pkgver() {
  cd "${srcdir}/${_reponame}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_reponame}"

  make build
}

package() {
  cd "${srcdir}/${_reponame}"

  patch -p1 < ../whoosh2.7.patch
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "ldoce5viewer/qtgui/resources/ldoce5viewer.svg" \
    "${pkgdir}/usr/share/pixmaps/ldoce5viewer.svg"
  install -Dm644 "ldoce5viewer.desktop" \
    "${pkgdir}/usr/share/applications/ldoce5viewer.desktop"
  install -Dm644 "LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 "COPYING.txt" \
    "${pkgdir}/usr/share/licenses/$pkgname/COPYING.txt"
}


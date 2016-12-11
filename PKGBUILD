pkgname=pywinery
pkgver=0.3.4
pkgrel=1
pkgdesc="Graphical and simple wine-prefix manager which allows you to launch apps and manage configuration of separate prefixes."
license=('GPLv3')
url='https://github.com/ergoithz/pywinery'
arch=('any')
makedepends=('python2')
depends=('python2' 'python2-gobject' 'xdg-utils' 'icoutils' 'pygtk' 'libglade' 'librsvg' 'wine')
optdepends=('winetricks: Install various redistributable runtime libraries in Wine')
install='pywinery.install'
source=('https://github.com/ergoithz/pywinery/releases/download/0.3.3/pywinery_0.3-3.tar.gz')
sha256sums=('ed2d5c103fa5a9fb8253532b66c718aee3c64d6c6488872322448731554033f5')

build() {
  cd ${srcdir}/${pkgver%.*}
  sed -i 's_^python_python2_' scripts/pywinery
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' pywinery/*.py
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgver%.*}
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ${pkgdir}/usr/share/pywinery/pywinery.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/pywinery.svg
  rm ${pkgdir}/usr/share/pywinery/pywinery.svg
}

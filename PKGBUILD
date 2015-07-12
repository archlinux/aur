pkgname=pywinery
pkgver=0.3
pkgrel=2
pkgdesc="Graphical and simple wine-prefix manager which allows you to launch apps and manage configuration of separate prefixes."
license=('GPLv3')
url='https://github.com/ergoithz/pywinery'
arch=('any')
makedepends=('python2')
depends=('python2' 'python2-gobject' 'xdg-utils' 'icoutils' 'pygtk' 'libglade' 'librsvg' 'wine')
optdepends=('winetricks: Install various redistributable runtime libraries in Wine')
install='pywinery.install'
source=('pywinery_0.3-2.tar.gz::https://drive.google.com/uc?export=download&id=0B4gfhO4VUgcfb2Z1RkNQT2wyYlU')
sha256sums=('12fb55ee5aa7cb82b68cb1a1f7c03bdde8af1c68d8c680c2dad7b7c806d48fcb')

build() {
  cd ${srcdir}/${pkgver}
  sed -i 's_^python_python2_' scripts/pywinery
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' pywinery/*.py
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ${pkgdir}/usr/share/pywinery/pywinery.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/pywinery.svg
  rm ${pkgdir}/usr/share/pywinery/pywinery.svg
}

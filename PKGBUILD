# $Id$
# Maintainer: Muges <git@muges.fr>

pkgname=erika-git
pkgver=v0.1.1
pkgrel=1
pkgdesc="A GTK+ podcast manager"
arch=('any')
license=('MIT')
url="https://github.com/Muges/erika"
depends=('gtk3' 'python-gobject' 'python-feedparser' 'python-lxml'
         'python-mutagen' 'python-mygpoclient' 'python-peewee' 'python-pillow'
         'python-requests' 'gst-plugins-base' 'gst-plugins-good'
         'gst-plugins-ugly' 'webkitgtk')
source=(${pkgname}::git+https://github.com/Muges/erika.git)
sha1sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${pkgname}"
  git describe | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python3 setup.py install --root="${pkgdir}" --skip-build --optimize=1
}

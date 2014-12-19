# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=3.1
pkgrel=2
pkgdesc="GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('any')
url="https://labs.nic.cz/page/969/datovka/"
license=('GPL2')
depends=('dslib' 'pygtk' 'python2-pyasn1' 'python2-sqlalchemy' 'sudsds' 'hicolor-icon-theme')
makedepends=('python2-setuptools')
optdepends=('python-reportlab: PDF production')
conflicts=('qdatovka')
install=$pkgname.install
source=(http://www.nic.cz/public_media/datove_schranky/releases/src/$pkgname-$pkgver.tar.gz)
sha256sums=('fe2e1698320c87ef305dbb040827612a9231da90f6411052f8e3d3ca4343e8fb')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="${pkgdir}"
}

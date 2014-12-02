# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=zfo-editor
pkgver=0.3.2
pkgrel=2
pkgdesc="ZFO editor allows user to interact with ZFO forms"
arch=('any')
url="http://labs.nic.cz/page/768/zfo-editor/"
license=('GPL2')
depends=('python2-lxml' 'pywebkitgtk')
makedepends=('python2-distribute')
source=(http://labs.nic.cz/files/labs/zfo_editor/$pkgname-$pkgver.tar.gz)
sha256sums=('36dda2e12f790c4a84ee81844ab226e8accbe8868ddbeabe0753112656b0a2c5')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="${pkgdir}"
}

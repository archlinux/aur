# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=outwiker
pkgver=2.0.0
pkgrel=1
arch=('any')
pkgdesc="Outliner and personal wiki with keeping the tree of notes in the form of directories on a disk"
url="http://jenyay.net/Outwiker/English"
license=('GPL3')
depends=('python2' 'wxpython2.8' 'pywebkitgtk' 'python2-pillow' 'python2-pyenchant')
optdepends=('mimetex: rendering of formulas')
conflicts=('outwiker-git')
source=("outwiker.deb::https://launchpad.net/~outwiker-team/+archive/ubuntu/ppa/+files/outwiker_2.0.0+822~zesty_all.deb");
sha256sums=('4d0dd13dce875ebfe359818e9a3bec127f6af53f21100138e5fbd8caf9cc9021')

package() {
	ar x outwiker.deb
	tar xf data.tar.xz -C ${pkgdir}
	cd ${pkgdir}
	# python2 fix
	for file in $(find . -name '*.py' -print); do
		sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
		sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
	done
	sed -i -e 's/python /python2 /' ${pkgdir}/usr/bin/${pkgname}
	find ${pkgdir}/usr/share/${pkgname} -type f -exec chmod a-x,u+w {} \;
}

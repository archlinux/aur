
pkgname=outwiker
pkgver=1.8.1
pkgrel=1
arch=('any')
pkgdesc="Outliner and personal wiki with keeping the tree of notes in the form of directories on a disk"
url="http://jenyay.net/Outwiker/English"
license=('GPL3')
depends=('python2' 'wxpython2.8' 'pywebkitgtk' 'python2-pillow')
optdepends=('mimetex: rendering of formulas'
            'python-gnomeprint: printing non-latin symbols')
conflicts=('outwiker-git')
source=("outwiker.deb::https://launchpad.net/~outwiker-team/+archive/ubuntu/ppa/+files/outwiker_1.8.1%2B752%7Etrusty_all.deb")
sha1sums=('f876cf2723162148508f1cf791e3069f27885b10')

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

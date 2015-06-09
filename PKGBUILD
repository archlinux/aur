# Contributor: Daniel Milde <info@milde.cz>

pkgname=deditor
pkgver=0.3.0
pkgrel=1
pkgdesc="The editor that boosts your python development"
url="https://launchpad.net/deditor"
license=(GPL)
arch=('i686' 'x86_64')
depends=('python2' 'wxpython' 'paramiko')
source=(http://launchpad.net/deditor/0.x/${pkgver}/+download/deditor_${pkgver}_all.deb
        'deditor.desktop'
        'deditor.sh')
md5sums=('5ab2ea783863ebf2af42964d78f1fa03'
         '90fb088dcb04194273428e67226fda2e'
         '22a730764194046734749a954dcfbd4f')

build() {
	cd ${srcdir}
	ar x deditor_${pkgver}_all.deb
	tar xzf data.tar.gz

	mv ./usr ${pkgdir}
	chmod -R 755 ${pkgdir}
	chmod 777 ${pkgdir}/usr/share/deditor/pluginconf.ded

	install -D -m755 ${srcdir}/deditor.sh ${pkgdir}/usr/bin/${pkgname}

	sed -i 's/env python/python2/' ${pkgdir}/usr/share/deditor/deditor.py
}

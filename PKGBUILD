# Contributor: Daniel Milde <info@milde.cz>

pkgname=deditor
pkgver=0.4.0
pkgrel=1
pkgdesc="The editor that boosts your python development"
url="https://launchpad.net/deditor"
license=(GPL)
arch=('i686' 'x86_64')
depends=('python2' 'wxpython' 'python2-paramiko')
source=(http://launchpad.net/deditor/0.x/${pkgver}/+download/deditor_${pkgver}_all.deb
        'deditor.desktop'
        'deditor.sh')
md5sums=('791411f0543f21c80f6801f8fc36abba'
         'f7d3479ee9342e3cee8de04d1b0d7dde'
         '22a730764194046734749a954dcfbd4f')

package() {
	cd ${srcdir}
	ar x deditor_${pkgver}_all.deb
	tar xzf data.tar.gz

	mv ./usr ${pkgdir}
	chmod -R 755 ${pkgdir}

	install -D -m755 ${srcdir}/deditor.sh ${pkgdir}/usr/bin/${pkgname}
	chmod 777 ${pkgdir}/usr/share/deditor/config/deditor.dpc
        install -D -m755 ${srcdir}/deditor.desktop ${pkgdir}/usr/share/applications/deditor.desktop

	sed -i 's/env python/python2/' ${pkgdir}/usr/share/deditor/deditor.py
}

# Maintainer: Cravix < dr dot neemous at gmail dot com >
# Contributor: Tom < reztho at archlinux dot us >
pkgname=pyjama
pkgver=0.3.0.78
pkgrel=1
pkgdesc="Unofficial Python/GTK Medialibrary for Jamendo"
arch=('any')
url="https://launchpad.net/pyjama"
license=('GPL')
depends=('pygtk' 'python2-simplejson' 'python2-pysqlite' 'gstreamer0.10-python' 'gstreamer0.10-bad-plugins' 'python2-numpy' 'gstreamer0.10-ugly-plugins' 'pyxml')
optdepends=('gnome-python-extras' 'python2-notify')
source=("http://xn--ngel-5qa.de/pyjama/release/pyjama-${pkgver}_all.tar.gz")
md5sums=('3df060cfabcc3e0ecc2879ca3c04c5be')

package() 
{
	cd ${srcdir}/${pkgname}-${pkgver}_all
	
	find . -name "*~*" -exec rm {} \;
	
	mkdir -p ${pkgdir}/usr/share/apps/pyjama

	cp -R ${srcdir}/${pkgname}-${pkgver}_all/src/* ${pkgdir}/usr/share/apps/pyjama/
	
	mkdir -p ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/applications
	cp ${pkgdir}/usr/share/apps/pyjama/images/pyjama.xpm ${pkgdir}/usr/share/pixmaps
	cp ${pkgdir}/usr/share/apps/pyjama/pyjama.desktop ${pkgdir}/usr/share/applications
	
	mkdir -p ${pkgdir}/usr/bin/
	echo '#!/bin/bash
python2 /usr/share/apps/pyjama/pyjama.py' > ${pkgdir}/usr/bin/pyjama
	chmod 755 ${pkgdir}/usr/bin/pyjama

	# It's compatible only with python 2
	sed -i 's@#!/usr/bin/env python@#!/usr/bin/env python2@' ${pkgdir}/usr/share/apps/pyjama/pyjama.py
}

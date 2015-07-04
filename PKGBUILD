
pkgname=outwiker-plugins
pkgver=1.8.1
pkgrel=1
_plugdir='/usr/share/outwiker/plugins'
arch=('any')
pkgdesc="Plugins for Outwiker"
url="http://jenyay.net/Outwiker/PluginsEn"
license=('GPL3')
depends=('outwiker>=1.8.1' 'python2-pygments')
source=("http://jenyay.net/uploads/Outwiker/Plugins/outwiker-plugins-all.zip")
sha1sums=('2c12a01e4c59fd80f445aaab24f88213ddc10ca5')

package() {
	rm -f ${srcdir}/outwiker-plugins-all.zip
	rm -rf ${srcdir}/datagraph/help/datagraph_rus #temporary solution
	install -d -m755 ${pkgdir}/${_plugdir}
	cp -r ${srcdir}/* ${pkgdir}/${_plugdir}/
	cd ${pkgdir}
	# python2 fix
	for file in $(find . -name '*.py' -print); do
		sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
		sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
	done
	find ${pkgdir}/${_plugdir} -type f -exec chmod a-x,u+w {} \;
}

#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Maintainer: Dawid Wrobel <cromo@klej.net>
#Maintainer: Sébastien Duquette <ekse.0x@gmail.com>
#Maintainer: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=2.1.5
pkgrel=1
pkgdesc="Utility to bruteforce web applications to find their not linked resources"
url="https://github.com/xmendez/wfuzz"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2-pycurl')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/xmendez/wfuzz/archive/v$pkgver.tar.gz")
md5sums=('c98c5ee8b92aade9ab513b55bd0dc057')
package() {
	mkdir -p ${pkgdir}/opt/wfuzz
    mkdir -p ${pkgdir}/usr/bin
	cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/wfuzz/
	echo -e "#!/bin/bash\n\ncd /opt/wfuzz\npython2 /opt/wfuzz/wfuzz.py \$@" > ${pkgdir}/usr/bin/wfuzz
    sed -i '0,/RE/s/python/python2/' ${pkgdir}/opt/wfuzz/wfuzz.py
	chmod a+x ${pkgdir}/usr/bin/wfuzz
}

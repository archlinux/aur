# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=zfsmond-git
pkgver=487922c
pkgrel=1
pkgdesc='Tiny ZFS Web Interface written in AngularJS and Flask Restful'
url='https://github.com/FireDrunk/ZFSmond'
license=('GPL')
depends=('python2-pyudev' 'python2-pysmart' 'python2-flask' 'python2-flask-restful' 'python2-enum34' 'python2-cffi' 'python2-libzfs-git')
source=('git://github.com/FireDrunk/ZFSmond' 'zfsmond.service')
sha512sums=('SKIP'
            'd37468885d1160086f37795ed552fc890db650602424c4f6724ed06cc70dd931a171bf05b26a87b0af499d15fb909d52af2605971cd02b1e3511f01e8f060b47')
arch=('any')

pkgver() {
	cd "${srcdir}/ZFSmond"
	git describe --always
}

package() {
	cd "${srcdir}/ZFSmond"
	install -Dm755 main.py "${pkgdir}/usr/share/webapps/ZFSmond/main.py"
	install -Dm644 "${srcdir}/zfsmond.service" "${pkgdir}/usr/lib/systemd/system/zfsmond.service"
	cp -Rp models static "${pkgdir}/usr/share/webapps/ZFSmond"
}

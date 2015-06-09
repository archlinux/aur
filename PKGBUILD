# Maintainer: Maskawanian <aur@cryingwolf.org>
pkgname=aria2-daemon-svn
pkgver=4
pkgrel=2
pkgdesc="Daemon scripts for aria2c."
arch=(any)
depends=('aria2')
license=('MIT')
makedepends=('subversion') 
url='http://code.google.com/p/ude-aria2-daemon/'
install=aria2-daemon-svn.install

_svntrunk=http://ude-aria2-daemon.googlecode.com/svn/trunk/
_svnmod=ude-aria2-daemon-read-only

build() {
	cd "${srcdir}"
	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up -r ${pkgver})
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi
	
	msg "SVN checkout done or server timeout"
	
	install -Dm644 "${srcdir}/ude-aria2-daemon-read-only/aria2c.conf.d" "${pkgdir}/etc/conf.d/aria2c"
	install -Dm600 "${srcdir}/ude-aria2-daemon-read-only/aria2c.conf" "${pkgdir}/etc/aria2c/aria2c.conf"
	install -Dm755 "${srcdir}/ude-aria2-daemon-read-only/aria2c.rc" "${pkgdir}/etc/rc.d/aria2c"
}

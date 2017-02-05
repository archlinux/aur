# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=bdisk
pkgver=3.01
pkgrel=1
_pkgver=${pkgver}
#_pkgver=${pkgver}-BETA
pkgdesc="An easy liveCD creator built in python. Supports hybrid ISOs/USB, iPXE, and UEFI."
arch=( 'i686' 'x86_64' )
url="https://bdisk.square-r00t.net"
license=( 'GPL3' )
depends=('dosfstools'
	'gcc-multilib'
	'gcc-libs-multilib'
	'git'
	'libisoburn'
	'dosfstools'
	'squashfs-tools'
	'python'
	'python-git'
	'python-humanize'
	'python-jinja'
	'python-psutil'
	'python-patch'
	'python-pygpgme'
	'python-pyopenssl'
	'python-validators')
#makedepends=( 'python' )
makedepends=()
conflicts=('bdisk-git')
_pkgname=BDisk
install=
changelog=
noextract=()
optdepends=('rsync: for rsync syncing'
	'syslinux: for ipxe support')
source=("https://git.square-r00t.net/${_pkgname}/snapshot/${_pkgname}-${_pkgver}.tar.xz"
        "${_pkgname}-${_pkgver}.tar.xz.sig")
sha512sums=('34f0f05712749f5fa9c32ed1df30a4b02a92add25d95297848095c6575a0e5a8f01b510a9be9f54a03618e2de7315196cbc599f85a1f0c95276e864e97515799'
            'SKIP')
package() {

	install -d -m0750 ${pkgdir}/etc/${pkgname}
	install -d -m0755 ${pkgdir}/usr/share/${pkgname}
	install -d -m0755 ${pkgdir}/usr/share/doc/${pkgname}
	install -d -m0755 ${pkgdir}/var/lib/${pkgname}
	install -d -m0755 ${pkgdir}/usr/bin

	cp -af ${srcdir}/${_pkgname}-${_pkgver}/docs/* ${pkgdir}/usr/share/doc/${pkgname}/.
	cp -af ${srcdir}/${_pkgname}-${_pkgver}/examples ${pkgdir}/usr/share/doc/${pkgname}/.
	curl -s -o ${pkgdir}/usr/share/doc/${pkgname}/README.html https://bdisk.square-r00t.net/
	cp -af ${srcdir}/${_pkgname}-${_pkgver}/overlay ${pkgdir}/var/lib/${pkgname}/.
	cp -af ${srcdir}/${_pkgname}-${_pkgver}/extra ${pkgdir}/var/lib/${pkgname}/.
	cp -af ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}/* ${pkgdir}/usr/share/${pkgname}/.
	mv -f ${pkgdir}/var/lib/${pkgname}/extra/pkg.build.ini ${pkgdir}/etc/${pkgname}/dist.build.ini
	rm -f ${pkgdir}/var/lib/${pkgname}/extra/dist.build.ini
	ln -sf /usr/share/bdisk/bdisk.py ${pkgdir}/usr/bin/bdisk

}

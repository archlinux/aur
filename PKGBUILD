# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=bdisk
pkgver=3.00
pkgrel=1
#_pkgver=${pkgver}
_pkgver=${pkgver}-BETA
pkgdesc="An easy liveCD creator built in python. Supports hybrid ISOs/USB, iPXE, and UEFI (undergoing rewrite)"
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
	'python-validators'
	'python-jinja'
	'python-psutil'
	'python-humanize')
#makedepends=( 'python' )
makedepends=()
_pkgname=BDisk
install=
changelog=
noextract=()
optdepends=('rsync: for rsync syncing'
	'syslinux: for ipxe support'
	'python-gitpython: for ipxe and git sync support'
	'python-pygpgme: for GPG support'
	'python-patch: for ipxe support'
	'python-pyopenssl: for iPXE support')
source=("https://git.square-r00t.net/${_pkgname}/snapshot/${_pkgname}-${_pkgver}.tar.bz2"
        "${_pkgname}-${_pkgver}.tar.bz2.sig")
sha512sums=('ffdfc612891a13b9a82835e4fda6ea5d734bc0bdfa310c81c9ef428c0868f96f77a9ea37b99b55d7bc14b5826e3a80ef1bf6c04704c602a154ed23688667e25c'
            'SKIP')
package() {

	install -d -m0750 ${pkgdir}/etc/${pkgname}
	install -d -m0755 ${pkgdir}/usr/share/${pkgname}
	install -d -m0755 ${pkgdir}/usr/share/doc/${pkgname}
	install -d -m0755 ${pkgdir}/var/lib/${pkgname}
	install -d -m0755 ${pkgdir}/usr/bin

	cp -af ${srcdir}/${_pkgname}-${_pkgver}/docs/* ${pkgdir}/usr/share/doc/${pkgname}/.
	cp -af ${srcdir}/${_pkgname}-${_pkgver}/examples ${pkgdir}/usr/share/doc/${pkgname}/.
	curl -s -o ${pkgdir}/usr/share/doc/README.html https://bdisk.square-r00t.net/
	cp -af ${srcdir}/${_pkgname}-${_pkgver}/overlay ${pkgdir}/var/lib/${pkgname}/.
	cp -af ${srcdir}/${_pkgname}-${_pkgver}/extra ${pkgdir}/var/lib/${pkgname}/.
	cp -af ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}/* ${pkgdir}/usr/share/${pkgname}/.
	mv -f ${pkgdir}/var/lib/${pkgname}/extra/pkg.build.ini ${pkgdir}/etc/${pkgname}/dist.build.ini
	rm -f ${pkgdir}/var/lib/${pkgname}/extra/dist.build.ini
	ln -sf /usr/share/bdisk/bdisk.py ${pkgdir}/usr/bin/bdisk

}

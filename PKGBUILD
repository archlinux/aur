# Maintainer: ActiveState Software Inc.
# Contributor: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>
pkgbase=komodo-pydbgp
pkgname=(python-pydbgp python2-pydbgp)
_srcrel=91033
_srcver=11.1.0
pkgver=11.1.0.${_srcrel}
pkgrel=1
pkgdesc="The Komodo IDE Python Remote Debugging component"
arch=('x86_64')
url="http://code.activestate.com/komodo/remotedebugging/"
license=('MIT')
depends=()
source=("http://downloads.activestate.com/Komodo/releases/${_srcver}/remotedebugging/Komodo-PythonRemoteDebugging-${_srcver}-${_srcrel}-linux-${arch[*]}.tar.gz")
md5sums=('09756df44b52d6d1e31d0ad0caa6d44a')

build() {
	cd "$srcdir/Komodo-PythonRemoteDebugging-${_srcver}-${_srcrel}-linux-${arch[*]}"
	cp pydbgpproxy py3_dbgpproxy
	sed -i '1s:/usr/bin/env python:/usr/bin/env python2:' pydbgp
	sed -i '1s:/usr/bin/env python:/usr/bin/env python2:' pydbgpproxy
}

package_python-pydbgp() {
	depends=(python)
	# Terrible hack to get site-packages of current python
	site_dir=$(python -c 'import sys; print(next(d for d in sys.path if "site-packages" in d))')
	cd "$srcdir/Komodo-PythonRemoteDebugging-${_srcver}-${_srcrel}-linux-${arch[*]}"
	mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/${site_dir}"
	cp py3_dbgp "${pkgdir}/usr/bin/"
	cp py3_dbgpproxy "${pkgdir}/usr/bin/"
	cp -r python3lib/dbgp  "${pkgdir}/${site_dir}"
}

package_python2-pydbgp() {
	depends=(python2)
	# Terrible hack to get site-packages of current python
	site_dir=$(python2 -c 'import sys; print(next(d for d in sys.path if "site-packages" in d))')
	cd "$srcdir/Komodo-PythonRemoteDebugging-${_srcver}-${_srcrel}-linux-${arch[*]}"
	mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/${site_dir}"
	cp pydbgp "${pkgdir}/usr/bin/"
	cp pydbgpproxy "${pkgdir}/usr/bin/"
	cp -r pythonlib/dbgp  "${pkgdir}/${site_dir}"
}

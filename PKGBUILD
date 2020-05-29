# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="deemix-pyweb-git"
_pkgname="deemix-pyweb"
pkgver=r107.df4f93f
pkgrel=1
pkgdesc="This is a pywebview wrapper for deemix-webui"
arch=('any')
url="https://notabug.org/RemixDev/$_pkgname"
license=('gpl3')
depends=('python>=3.6' 'deemix' 'python-flask' 'python-flask-socketio' 'python-pywebview')
provides=('deemix-pyweb')
source=("${_pkgname}::git+https://notabug.org/RemixDev/$_pkgname"
        "deemix-webui::git+https://notabug.org/RemixDev/deemix-webui")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
	cp -dr --no-preserve=ownership ${_pkgname}/* "${pkgdir}/usr/lib/${_pkgname}/"
	cp -dr --no-preserve=ownership deemix-webui/* "${pkgdir}/usr/lib/${_pkgname}/webui"
	
	chmod +x "${pkgdir}/usr/lib/${_pkgname}/server.py"
	chmod +x "${pkgdir}/usr/lib/${_pkgname}/deemix_gui.py"
	
	install -dm755 "${pkgdir}/usr/share/applications/"
	ln -s  "/usr/lib/${_pkgname}/deemix-pyweb.desktop" "${pkgdir}/usr/share/applications/deemix-pyweb.desktop"
	
	install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/server.py" "${pkgdir}/usr/bin/${_pkgname}-server"
    ln -s "/usr/lib/${_pkgname}/deemix_gui.py" "${pkgdir}/usr/bin/${_pkgname}"
}
 

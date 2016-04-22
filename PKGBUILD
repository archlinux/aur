
_pkgname=dontpanic
pkgname=${_pkgname}-git
pkgver=v1.3.r0.gcebd777
pkgrel=1
pkgdesc="Dontpanic is a python app to look for any movie or serie and watch them in 'streaming'. It looks like popcorntime, but doesn't depend of a centralized api."
arch=(any)
url=https://git.framasoft.org/Thuban/$_pkgname
license=(GPL3)

depends=('python-bottle' 'python-requests' 'python-beautifulsoup4' 'python-libtorrent-rasterbar>=1.0.8' 'sqlite')
optdepends=('python-cherrypy: for server mode')
makedepends=('git')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://git.framasoft.org/Thuban/${_pkgname}.git"
	"${_pkgname}.install")
	
sha256sums=('SKIP' 'SKIP')

install="${_pkgname}.install"

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/static/"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/views/"
    install -dm755 "${pkgdir}/usr/share/man/man1/"

    cd  "${srcdir}/${_pkgname}/"
    for _file in *.py
    do
	install -D -m 644 ${_file} "${pkgdir}/usr/share/${_pkgname}/"
    done

    cd "${srcdir}/${_pkgname}/static/"
    for _file in *.png *.ico *.css
    do
	install -D -m 644 ${_file} "${pkgdir}/usr/share/${_pkgname}/static/"
    done

    cd "${srcdir}/${_pkgname}/views/"
    for _file in *.tpl
    do
	install -D -m 644 ${_file} "${pkgdir}/usr/share/${_pkgname}/views/"
    done
        
    install -D -m 755 "${srcdir}//${_pkgname}/dontpanic" "${pkgdir}/usr/bin/dontpanic"
    
    install -Dm644 "${srcdir}/${_pkgname}/dontpanic.png" "${pkgdir}/usr/share/pixmaps/dontpanic.png"
    
    install -Dm644 "${srcdir}/${_pkgname}/dontpanic.desktop" "${pkgdir}/usr/share/applications/dontpanic.desktop"

    install  -Dm644 "${srcdir}/${_pkgname}/dontpanic.1.gz" "${pkgdir}/usr/share/man/man1/"
    
}



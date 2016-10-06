
_pkgname=dontpanic
pkgname=${_pkgname}-latest
pkgver=0.0.2
pkgrel=1
#epoch=1
pkgdesc="Dontpanic is a python app to look for any movie or serie and watch them in 'streaming'. It looks like popcorntime, but doesn't depend of a centralized api."
arch=(any)
url=http://3hg.toile-libre.org/dontpanic/index.html
license=(GPL3)

depends=('python-bottle' 'python-requests' 'python-beautifulsoup4' 'sqlite' 'libtorrent-rasterbar')
optdepends=('python-cherrypy: for server mode')
makedepends=('git')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::http://3hg.toile-libre.org/dontpanic/downloads/dontpanic-latest.tgz")
	
sha256sums=('af27c55778289a8bae5d7b18abe62fd36a06b42a29a06f60aa396b26044871ad')

pkgver() {
	cd "${srcdir}/${_pkgname}/src"
#	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	echo 0.0.2
}

package() {
    
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/static/"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/views/"
    install -dm755 "${pkgdir}/usr/share/man/man1/"

    cd  "${srcdir}/${_pkgname}/src/"
    for _file in *.py
    do
	install -D -m 644 ${_file} "${pkgdir}/usr/share/${_pkgname}/"
    done

    cd "${srcdir}/${_pkgname}/src/static/"
    for _file in *.png *.ico *.css
    do
	install -D -m 644 ${_file} "${pkgdir}/usr/share/${_pkgname}/static/"
    done

    cd "${srcdir}/${_pkgname}/src/views/"
    for _file in *.tpl
    do
	install -D -m 644 ${_file} "${pkgdir}/usr/share/${_pkgname}/views/"
    done
        
    install -D -m 755 "${srcdir}//${_pkgname}/dontpanic" "${pkgdir}/usr/bin/dontpanic"
    
    install -Dm644 "${srcdir}/${_pkgname}/src/dontpanic.png" "${pkgdir}/usr/share/pixmaps/dontpanic.png"
    
    install -Dm644 "${srcdir}/${_pkgname}/dontpanic.desktop" "${pkgdir}/usr/share/applications/dontpanic.desktop"

    install  -Dm644 "${srcdir}/${_pkgname}/dontpanic.1.gz" "${pkgdir}/usr/share/man/man1/"
    
}



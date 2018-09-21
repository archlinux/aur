# Maintainer: Fanch
# Maintainer: Alexandre Teles (afterSt0rm) <ateles.1@gmail.com>

_pkgname=dontpanic
pkgname=${_pkgname}-latest
pkgver=2.0
pkgrel=2

pkgdesc="Dontpanic is a free (as in "freedom") python application to look for any movie or serie and watch them in "streaming". It looks like popcorntime or torrent time, but doesn't depend of a centralized api."

arch=(any)
url=https://3hg.fr/Bonus/dontpanic/index.html
license=(MIT)

depends=('python-bottle' 'python-requests' 'python-beautifulsoup4' 'sqlite' 'libtorrent-rasterbar' 'xdg-utils')
optdepends=('python-cherrypy: for server mode')
makedepends=('git')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://framagit.org/Thuban/dontpanic/repository/master/archive.tar.gz")
noextract=("archive.tar.gz")

sha256sums=('7eee2a596f75d69f5be09870722fe0f2ee7a0270ab39dfa943426a6f964ed493')

pkgver() {
    curl -s https://3hg.fr/Bonus/dontpanic/version
}

prepare() {
    mkdir dontpanic && tar zxvf archive.tar.gz -C dontpanic --strip-components 1
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/dontpanic/"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/static/"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}/views/"
    install -dm755 "${pkgdir}/usr/share/man/man1/"

    cd  "${srcdir}/${_pkgname}/src/"
    for _file in *.py
    do
	install -D -m 644 ${_file} "${pkgdir}/usr/share/${_pkgname}/"
    done

    cd  "${srcdir}/${_pkgname}/src/dontpanic/"
    for _file in *.py
    do
	install -D -m 644 ${_file} "${pkgdir}/usr/share/${_pkgname}/dontpanic/"
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



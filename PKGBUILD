# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="deezloader-remix-git"
_pkgname="DeezloaderRemix"
pkgver=4.1.7.r3.g6e57671
pkgrel=1
pkgdesc="Deezloader Remix is an improved version of Deezloader based on the Reborn branch"
arch=('x86_64')
url="https://notabug.org/RemixDevs/${_pkgname}"
license=('GPL3')
makedepends=('git' 'npm')
source=("git+https://notabug.org/RemixDevs/${_pkgname}"
        "${_pkgname}.desktop")
md5sums=('SKIP'
         '5d12c62e4eab4bb22346ac934598c601')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/${_pkgname}
	npm install
    npm run dist:linux
}

package() {
    cd ${srcdir}/${_pkgname}
    
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/* "${pkgdir}/usr/lib/${_pkgname}/"
    
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 app/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/deezloader-rmx" "${pkgdir}/usr/bin/deezloader-remix"
    
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
 
 

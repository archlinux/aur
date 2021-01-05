# Maintainer: Simone Scalabrino <s.scalabrino9@gmail.com>
_appname="gsuite"
_appdesc="Standalone silo apps for the Google office suite (Drive, Documents and Sheets)"
_gittag="0.4"

_gitname=silos-apps
pkgname="silo-${_appname}"
pkgver=$_gittag
pkgrel=1
pkgdesc="${_appdesc}"
arch=('i686' 'x86_64')
url="https://github.com/intersimone999/${_gitname}"
license=('GPL3')
depends=('silos')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${_gitname}/${_appname}"
    
    basefolder="/usr/share/silos-apps"
    
    iconsfolder="${basefolder}/icons"
    for f in ${srcdir}/${_gitname}/${_appname}/icons/*.svg
    do
        target=$(basename "$f")
        install -Dm755 "$f" "${pkgdir}/usr/share/pixmaps/silo-$target"
        install -Dm755 "$f" "${pkgdir}/${iconsfolder}/$target"
    done
    
    for f in ${srcdir}/${_gitname}/${_appname}/desktops/*.desktop
    do
        target=$(basename "$f")
        install -Dm755 "$f" "${pkgdir}/usr/share/applications/silo-$target"
    done
    
    appsfolder="${basefolder}/apps"
    for f in ${srcdir}/${_gitname}/${_appname}/apps/*.qtws
    do
        target=$(basename "$f")
        install -Dm755 "$f" "${pkgdir}/${appsfolder}/$target"
    done
}
 

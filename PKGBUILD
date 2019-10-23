PACKAGER='Simone Scalabrino <s.scalabrino9@gmail.com>'
pkgname=silos
_gitname=pyqtws
_gittag=0.1.3
pkgver=$_gittag
pkgrel=1
pkgdesc='Standalone web-app container based on qt5-webengine'
arch=('i686' 'x86_64')
url='https://github.com/intersimone999/pyqtws'
license=('MIT')
depends=('xdg-utils' 'qt5-webengine' 'python' 'python-pip')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

# pkgver() {
#    cd ${srcdir}/${_gitname}
#    
#    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# 
# }

build() {
    cd "${srcdir}/${_gitname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    
    mkdir -p "${pkgdir}/usr/share/pixmaps/silos"
    
    for f in ${srcdir}/pyqtws/pyqtws/icons/*.svg
    do
        target=$(basename "$f")
        install -Dm755 "$f" "${pkgdir}/usr/share/pixmaps/silo-$target"
    done
    
    for f in ${srcdir}/pyqtws/pyqtws/desktops/*.desktop
    do
        target=$(basename "$f")
        install -Dm755 "$f" "${pkgdir}/usr/share/applications/silo-$target"
    done
}

# Maintainer: Linus Dierheimer Linus@Dierheimer.de

_gitname='run'
_gitroot='https://github.com/LinusDierheimer/run.git'

pkgname='run'
pkgdesc='start programs from shell in a configurable environment'
pkgver='1'
pkgrel='1'
#epoch=
arch=('x86_64')
url=$_gitroot
license=('GPL3')
#groups=()
depends=('sudo')
makedepends=('git' 'cmake')
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install="$pkgname.install"
#changelog=
#source=()
#noextract=()
#sha512sums=()
PKGEXT='.pkg.tar.gz'

build() {
    cd "$srcdir"

    if [ -d "${srcdir}/${_gitname}" ] ; then
        cd ${_gitname}
        git pull --rebase
    else
        git clone ${_gitroot}
        cd ${_gitname}
    fi

    mkdir -p build/
    cd build/
    cmake ..
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/include/"
    install -C "${srcdir}/${_gitname}/build/run" "${pkgdir}/usr/bin/"
    install -C "${srcdir}/${_gitname}/src/run.h" "${pkgdir}/usr/include/"
}
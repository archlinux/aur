# Maintainer: Eugene Lebedev <satanych13+dev@gmail.com>

_pkgname=mcachefs
pkgname="mcachefs-git"
pkgver=94.4307651
pkgrel=1
pkgdesc="Simple filesystem-based file cache based on FUSE"
arch=('i686' 'x86_64')
url="https://github.com/Doloops/mcachefs"
license=('Apache')
depends=('fuse')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=(mcachefs::git+https://github.com/Doloops/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {    
    cd mcachefs
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd mcachefs/src
    make PREFIX=/usr
}

package() {
    cd mcachefs/src
    mkdir -p "$pkgdir/usr/include/${_pkgname}"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm755 *.h "$pkgdir/usr/include/${_pkgname}/"
}

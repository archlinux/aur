# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=linuxkit-git
_pkgname=linuxkit
pkgver=0.7.r249.gfce020a11
pkgrel=1
pkgdesc="A toolkit for building secure, portable and lean operating systems for containers - git version"
arch=('x86_64')
url="https://github.com/linuxkit/linuxkit"
license=('APACHE')
makedepends=('git' 'docker')
source=("git+https://github.com/linuxkit/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    #make DESTDIR="${pkgdir}/" install
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755  bin/linuxkit "${pkgdir}/usr/bin"
    install -Dm755  bin/rtf "${pkgdir}/usr/bin"
}


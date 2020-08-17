# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# Contributor: Ricardo Band <email@ricardo.band>
pkgname=linuxkit-git
_pkgname=linuxkit
pkgver=0.8.r9.ga2869a354
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
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 bin/linuxkit "${pkgdir}/usr/bin"
    install -Dm755 bin/rtf "${pkgdir}/usr/bin"
}

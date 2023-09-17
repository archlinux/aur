# Maintainer: Nara Díaz Viñolas <rdvdev2@gmail.com>

pkgname=pixiecore-git
_pkgname='pixiecore'
pkgver=r353.64f6de6
pkgrel=2
pkgdesc="An all-in-one tool for easy netbooting"
arch=('any')
url="https://godoc.org/go.universe.tf/netboot/pixiecore"
license=('Apache')
makedepends=('git' 'go' 'gcc' 'binutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://github.com/danderson/netboot.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# https://wiki.archlinux.org/index.php/Go_package_guidelines

build() {
    cd "${srcdir}/${_pkgname}"
    go build \
        -o ${_pkgname} \
        ${srcdir}/${_pkgname}/cmd/pixiecore
}

package() {
    cd ${srcdir}/${_pkgname}/${_pkgname}
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

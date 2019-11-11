# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=pixiecore-git
_pkgname='pixiecore'
pkgver=r328.72fa512
pkgrel=1
pkgdesc="An all-in-one tool for easy netbooting"
arch=('any')
url="https://godoc.org/go.universe.tf/netboot/pixiecore"
license=('Apache')
makedepends=('go'
'gcc'
'binutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}") # pending removal from AUR; upstream has no static versioning
source=("${_pkgname}::git+https://github.com/danderson/netboot.git#branch=master")
sha512sums=('SKIP')
 
pkgver(){
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
# https://wiki.archlinux.org/index.php/Go_package_guidelines
 
build(){
    cd "${srcdir}/${_pkgname}"
    #EXTRA_GOFLAGS="-trimpath" \
    #LDFLAGS="-linkmode external -extldflags \"${LDFLAGS}\""
    #make GOFLAGS="-v" build
    #export GOPATH="${srcdir}/${_pkgname}"
    #export GO111MODULES=off
    go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS" \
        -o ${_pkgname} \
        ${srcdir}/${_pkgname}/cmd/pixiecore
}
 
package() {
    cd ${srcdir}/${_pkgname}/${_pkgname}
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

# Maintainer: fzerorubigd <fzero@rubi.gd>

pkgname=gomodifytags-git
pkgver=105.20210922
pkgrel=1
pkgdesc="Go tool to modify struct field tags"
arch=('i686' 'x86_64')
url="https://github.com/fatih/gomodifytags"
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
source=('git+https://github.com/fatih/gomodifytags')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/gomodifytags"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --format=%cd --date=short | tr -d -)"
}

prepare() {
    mkdir -p "${srcdir}/src/github.com/fatih/"
    ln -sf "${srcdir}/gomodifytags" "${srcdir}/src/github.com/fatih/"
}

build() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/fatih/gomodifytags"
    go get -v
    go build -o gomodifytags
}

package() {
    cd "${srcdir}/src/github.com/fatih/gomodifytags"
    install -Dm755 gomodifytags "${pkgdir}/usr/bin/gomodifytags"
}

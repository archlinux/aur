# Maintainer: fzerorubigd <fzero@rubi.gd>

pkgname=godoctor-git
pkgver=520.20211103
pkgrel=1
pkgdesc="Go Doctor - The Golang Refactoring Engine"
arch=('i686' 'x86_64')
url="https://github.com/godoctor/godoctor"
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
source=('git+https://github.com/godoctor/godoctor')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/godoctor"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --format=%cd --date=short | tr -d -)"
}

prepare() {
    mkdir -p "${srcdir}/src/github.com/godoctor/"
    ln -sf "${srcdir}/godoctor" "${srcdir}/src/github.com/godoctor/"
}

build() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/godoctor/godoctor"
    go get -v
    go build -o godoctor
}

package() {
    cd "${srcdir}/src/github.com/godoctor/godoctor"
    install -Dm755 godoctor "${pkgdir}/usr/bin/godoctor"
}

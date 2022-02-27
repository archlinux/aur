# Maintainer: fzerorubigd <fzero@rubi.gd>

pkgname=goimpl-git
pkgver=39.20220214
pkgrel=1
pkgdesc="impl generates method stubs for implementing an interface."
arch=('i686' 'x86_64')
url="https://github.com/josharian/impl"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=('git+https://github.com/josharian/impl')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/impl"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --format=%cd --date=short | tr -d -)"
}

prepare() {
    mkdir -p "${srcdir}/src/github.com/josharian/"
    ln -sf "${srcdir}/impl" "${srcdir}/src/github.com/josharian/"
}

build() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/josharian/impl"
    go get -v
    go build -o impl
}

package() {
    cd "${srcdir}/src/github.com/josharian/impl"
    install -Dm755 impl "${pkgdir}/usr/bin/impl"
}

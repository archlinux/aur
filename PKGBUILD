# Maintainer: Rémy Mathieu <me@remy.io>
pkgname=upd-git
pkgver=1.0
pkgrel=1
pkgdesc="File sharing daemon/client".
arch=('i686' 'x86_64')
url="https://github.com/remeh/upd"
license=('Apache 2.0')
groups=()
depends=()
makedepends=('go' 'git')
install=
source=("git://github.com/remeh/upd.git")
md5sums=('SKIP')

build() {
    export GOPATH=$srcdir
    go get github.com/mattn/gom
    cd ${srcdir}/upd
    git checkout 1.0
    ${srcdir}/bin/gom install
    ${srcdir}/bin/gom build bin/server/server.go
    ${srcdir}/bin/gom build bin/client/client.go
}

package() {
    cd $_gitname
    install -Dm755 "${srcdir}/upd/server" "$pkgdir/usr/bin/upd-server"
    install -Dm755 "${srcdir}/upd/client" "$pkgdir/usr/bin/upd-client"
}

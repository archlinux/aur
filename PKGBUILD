# Maintainer: Jojii <jojii@gmx.net>
pkgname=rbuild-cli-git
pkgver=1.2.r14.c8bb8f1
pkgrel=1
epoch=
pkgdesc="The official cli client for the remote build system"
arch=('i686' 'x86_64')
url="https://github.com/JojiiOfficial/RemoteBuildClient"
license=('MIT')
groups=()
depends=()
makedepends=(
    'git'
    'go'
)

options=()
install=
changelog=
source=("git+$url")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/RemoteBuildClient"
    printf "1.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/RemoteBuildClient"
    go get -v
}

build() {
    cd "$srcdir/RemoteBuildClient"
    go build -o rbuild
}

package() {
    cd "$srcdir/RemoteBuildClient"
    mkdir -p $pkgdir/usr/bin
    install -DT rbuild $pkgdir/usr/bin/rbuild
}

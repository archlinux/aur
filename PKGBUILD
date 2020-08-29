# Maintainer: Jojii <jojii@gmx.net>
pkgname=rbuild-cli-git
pkgver=v1.0.0
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
    git describe --tags --abbrev=0 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

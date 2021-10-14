# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=giter-git
pkgver=20190118.r17.6bc7a81
pkgrel=1
pkgdesc="git user manager"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/jsmartx/giter"
license=('UNKNOWN')
depends=('glibc' 'git')
makedepends=('go')
provides=('giter')
conflicts=('giter')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

build() {
    cd "${srcdir}"/"${pkgname}"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.io,direct
    go build -ldflags '-s -w' -o giter
}

package() {
    cd "${srcdir}"/"${pkgname}"/
    install -Dm 755 giter -t "${pkgdir}"/usr/bin/
}

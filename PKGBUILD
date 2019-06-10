# Maintainer: Max Struebing <mxstrbng@gmail.com>

pkgname=duration-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Shows how long a process is already running"
arch=(any)
url="https://github.com/mstruebing/duration"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+$url")
md5sums=('SKIP')
provides=('duration')

pkgver() {
    cd "$srcdir/duration" || exit
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
    cd "$srcdir/duration" 
    go get -u github.com/mstruebing/duration
    make build
}

package() {
    cd "$srcdir/duration/bin" || exit
    install -Dm755 duration "$pkgdir/usr/bin/duration"
    cd "$srcdir/duration" || exit
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/duration/LICENSE"
}

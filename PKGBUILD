# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>

pkgname=gmtrn-cli
pkgver=r14.d058bb6
pkgrel=1
pkgdesc="Simple CLI client for http://multitran.ru"
arch=('x86_64' 'i686')
url="https://github.com/vladimir-g/gmtrn"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("${pkgname}::git+https://github.com/vladimir-g/gmtrn.git")
md5sums=('SKIP')
_gourl="github.com/vladimir-g/gmtrn"

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p $(dirname "$srcdir"/src/"${_gourl}")
    # remove old source directory if exists
    rm -Rf "$srcdir"/src/"${_gourl}"
    mv "$pkgname" "$srcdir"/src/"${_gourl}"
}

build() {
    GOPATH="$srcdir" go get -v -x "${_gourl}/"...
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

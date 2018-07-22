# Maintainer: rouhannb <rouhannb@gmail.com>
_basename=joycon
pkgname="$_basename-git"
pkgver='r99.144b22d'
pkgrel='1'
pkgdesc='Joy-Con input driver'
arch=('x86_64')
url="https://github.com/riking/$_basename"
license=('unknown')
depends=('libudev.so')
makedepends=('go' 'git')
provides=("$_basename")
conflicts=("$_basename")
_gourl="github.com/riking/$_basename/prog4/jcdriver"

prepare() {
	GOPATH="$srcdir" go get -d -u $_gourl
}

pkgver() {
    cd "$srcdir/src/$_gourl"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"
	GOPATH="$srcdir" go build $_gourl
}

package() {
    install -Dm755 "$srcdir/jcdriver" "$pkgdir/usr/bin/jcdriver"
}

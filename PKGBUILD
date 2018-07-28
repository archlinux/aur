# Maintainer: rouhannb <rouhannb@gmail.com>
_basename=joycon
pkgname="$_basename-git"
pkgver=r99.144b22d
pkgrel=4
pkgdesc='Joy-Con input driver'
arch=('x86_64')
url="https://github.com/riking/$_basename"
license=('unknown')
depends=('libsystemd')
makedepends=('go' 'git')
provides=("$_basename")
conflicts=("$_basename")
source=("git+https://github.com/riking/$_basename.git")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$_basename/prog4/jcdriver"
    GOPATH="$(pwd)" go get -d 
}

pkgver() {
    cd "$srcdir/$_basename"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_basename/prog4/jcdriver"
    GOPATH="$(pwd)" go build
}

package() {
    install -Dm755 "$srcdir/$_basename/prog4/jcdriver/jcdriver" "$pkgdir/usr/bin/jcdriver"
}

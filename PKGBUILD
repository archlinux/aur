# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org> (rclone-git pkgbuild)

_pkgname=tisp
_ghuser=raviqqe
pkgname="${_pkgname}-git"
pkgver=r711.5d0d87d
pkgrel=1
pkgdesc='Time is Space: Functional, async-by-default programming language built with Go'
arch=('i686' 'x86_64')
url="https://github.com/${_ghuser}/${_pkgname}"
license=('MIT')
makedepends=('git' 'go')
source=("${_pkgname}::git+https://github.com/${_ghuser}/${_pkgname}.git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP')

prepare () {
    cd ${_pkgname}

    mkdir -p .gopath/src/github.com/${_ghuser}
    ln -sf "$PWD" .gopath/src/github.com/${_ghuser}/${_pkgname}
    export GOPATH="$PWD/.gopath"

    go get github.com/${_ghuser}/${_pkgname}/src/cmd/tisp
}

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#build() {
#    cd ${_pkgname}

#    go build # -gccgoflags "$CFLAGS $LDFLAGS"
#    PATH="$GOPATH/bin:$PATH" make doc
#}

package() {
    install -Dm755 "${_pkgname}/.gopath/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

#    install -Dm644 ${_pkgname}.1 "$pkgdir/usr/share/man/man1/${_pkgname}.1"
#    install -d "$pkgdir/usr/share/doc/$pkgname"
#    install -t "$pkgdir/usr/share/doc/$pkgname" -m644 MANUAL.html MANUAL.txt
}

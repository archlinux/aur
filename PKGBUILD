# Maintainer: Gökberk Yaltıraklı <aur at gkbrk dot com>
pkgname=aerc2-git
pkgver=r170.1554065285.60627c9
pkgrel=1
pkgdesc='Terminal email client'
arch=('i686' 'x86_64')
url='https://git.sr.ht/~sircmpwn/aerc2'
license=('MIT')
depends=('libvterm')
makedepends=('go')
provides=('aerc2')
conflicts=('aerc2')
source=("aerc2::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/aerc2"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    mkdir -p gopath/src/git.sr.ht/~sircmpwn/aerc2
    rm -rf gopath/src/git.sr.ht/~sircmpwn/aerc2
    mv aerc2 gopath/src/git.sr.ht/~sircmpwn/
    GOPATH="$(pwd)/gopath" go get -v git.sr.ht/~sircmpwn/aerc2
    GOPATH="$(pwd)/gopath" go build -o "$srcdir/build/aerc2" git.sr.ht/~sircmpwn/aerc2
}

package() {
    install -Dm755 "$srcdir/build/aerc2" "$pkgdir/usr/bin/aerc2"
}

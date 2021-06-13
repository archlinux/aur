# Maintainer: Roshless <pkg@roshless.com>

pkgname=kineto-git
pkgver=r21.988a00f
pkgrel=1
pkgdesc='An HTTP to Gemini proxy'
url='https://git.sr.ht/~sircmpwn/kineto'
arch=('x86_64' 'i686')
license=('GPL')
depends=('glibc')
makedepends=('git' 'go')
source=("kineto-git::git+https://git.sr.ht/~sircmpwn/kineto")

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o kineto .
}

package() {
    cd $pkgname
    install -Dm755 kineto -t "$pkgdir/usr/bin/"
}

md5sums=('SKIP')

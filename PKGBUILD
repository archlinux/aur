# Maintainer: Hristos N. Triantafillou <me@hristos.co>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=wem
pkgver=0.8.6
pkgrel=1
pkgdesc='Wine Environment Manager: A CLI tool for managing wine "envs" or prefixes.'
arch=('x86_64')
url='https://git.sr.ht/~hristoast/wem'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('30d67859a1c1849d17e2e2e32a38059056ef2e7646b99f076dc7ac7292b155fcd0ff3a466578cd83f6ca021c86ea7b77e2ca63bc47557a9d9b960c24a082616e')

build() {
    ## From Go package guidelines
    ## https://wiki.archlinux.org/title/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -o wem wem.go
}

package() {
    cd "$pkgname-$pkgver"
    install -D wem -t "$pkgdir/usr/bin/"
}

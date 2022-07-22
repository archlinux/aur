# Maintainer: Hristos N. Triantafillou <me@hristos.co>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=wem
pkgver=0.8.8
pkgrel=1
pkgdesc='Wine Environment Manager: A CLI tool for managing wine "envs" or prefixes.'
arch=('x86_64')
url='https://git.sr.ht/~hristoast/wem'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('732bb3baf195be273f211ca7f469d13c85e3389eb3b61818bcf1bd62725270832730c1dab1f5fc788a2f31743fb3be5137441e9f7bac19a33a8fae093183fa9d')

build() {
    ## From Go package guidelines
    ## https://wiki.archlinux.org/title/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -o wem ./cmd/wem
}

package() {
    cd "$pkgname-$pkgver"
    install -D wem -t "$pkgdir/usr/bin/"
}

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
sha512sums=('d5b49348fa60b5c3e9f6309c0b662dccc52ef4e59f13ec806faa5a6c4c84760edb91f029cdf909c7f945f668773f07f62229bfd0f3aee1860acffe7707fad7eb')

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

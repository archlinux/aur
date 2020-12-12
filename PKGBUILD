# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=storj-uplink
_basename=storj
pkgver=1.18.1
pkgrel=1
pkgdesc="Storj Tardigrade Uplink"
arch=('x86_64')
url="https://github.com/storj/storj"
license=(' AGPL-3.0')
source=("https://github.com/${_basename}/${_basename}/archive/v1.18.1.tar.gz")
makedepends=('go')

sha512sums=('789653290a5caaf9f07ed6e9c082d1829793553f98499534b6e83dc41bad4e08c44c50c2ec3c4151b34421b72fee5e9f808af3bd6903e542074342805e2289b8')

prepare(){
    cd "$_basename-$pkgver"
    mkdir -p build/
}

build() {
    cd "$_basename-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/uplink
}

package() {
    cd "$_basename-$pkgver"
    install -Dm755 build/uplink "${pkgdir}/usr/bin/uplink"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

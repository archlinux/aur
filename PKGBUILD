# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=jdrive-client
pkgver=1.1.0
pkgrel=1
pkgdesc="JDrive socket client"
arch=('x86_64' 'i686') #Any that can fill the dependencies
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
provides=("jdrive-client")
makedepends=("go")
optdepends=(
    "jdrive: JDrive main package"
)
source=("${url}/-/archive/v${pkgver}/jdrive-client-v${pkgver}.tar.gz")
sha512sums=('8734c1059582827ed2e49e7b1d64a6247039bc3630e79952d1d7a0ad4bdf637e571efa781f9141d1aa954ff100d6bc30f1ef6cbc32cceb05d01de049ee8ccd4a')

build(){
    export GOFLAGS="-buildmode=pie -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
    cd "$pkgname-v$pkgver"
    go build -o $pkgname .
}

package(){
    cd "$pkgname-v$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

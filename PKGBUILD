# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=jdrive-client
pkgver=1.0.1
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
sha512sums=('dc13ced635c0a69fca702a85edfc4718c63151140428eb5b641c5798e66a6ed67b73a49d6977d155cb6e9a3c29dd8e0d17886033598ac6d90225c91970e7b50d')

build(){
    export GOFLAGS="-buildmode=pie -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
    cd "$pkgname-v$pkgver"
    go build -o $pkgname .
}

package(){
    cd "$pkgname-v$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

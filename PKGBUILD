# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=jdrive-client
pkgver=1.0.2
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
sha512sums=('045cbc8a8edd60d453fc3df6eceabcb3ed8f812d431e9cc433bd50ddfabc900d75ffe3089a5c6fca983edafaaa96da7f2f0002a30a70f3f451cab11bb19280ce')

build(){
    export GOFLAGS="-buildmode=pie -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
    cd "$pkgname-v$pkgver"
    go build -o $pkgname .
}

package(){
    cd "$pkgname-v$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

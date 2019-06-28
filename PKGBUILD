# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=jdrive-client
pkgver=1.2.0
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
sha512sums=('1f3dca5206c7f3ce090b5dae419c5894cbede706bddd0ca262a783e3ef5a4a0e3c3610aa310a0cd09c55b2e1e364de31e97c30b05c3ef92aac028b4c918ed5a2')

build(){
    export GOFLAGS="-buildmode=pie -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
    cd "$pkgname-v$pkgver"
    go build -o $pkgname .
}

package(){
    cd "$pkgname-v$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

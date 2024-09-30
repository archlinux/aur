# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=horcrux
pkgver=0.3
pkgrel=1
pkgdesc="Split your file into encrypted fragments so that you don't need to remember a passcode"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/jesseduffield/horcrux"
license=('GPL-3.0-only')
makedepends=('git' 'go')
source=("git+$url#tag=v$pkgver")
sha512sums=('197db754c15acdbbde48e760a633ad4997a5f49613f6236c167f51cb27b596dab6d7fbf1fbe3ecea1434c763feee49f5720da6f1df91f5fd5fcae3eae849e6c5')
conflicts=('horcrux-git')

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o horcrux .
}

package() {
    cd $pkgname
    install -Dm755 horcrux -t "$pkgdir/usr/bin/"
}

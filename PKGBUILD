# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="nputop-git"
pkgver=r5.bfb22a4
pkgrel=1
pkgdesc="Displaying Intel NPU usage on Linux"
url="https://github.com/ZoLArk173/nputop"
license=("MIT")
arch=("x86_64" "aarch64")
makedepends=('cargo')
source=("git+$url")
b2sums=('SKIP')

pkgver(){
 cd "${pkgname/-git/}"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "${pkgname/-git/}"
 cargo build --release
}

package(){
 cd "${pkgname/-git/}"
 install -D -m 755 "target/release/nputop" "$pkgdir/usr/bin/nputop"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-git/}/LICENSE"
}

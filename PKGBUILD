# Maintainer: whoami <whoami@systemli.org>

pkgname=vlang
pkgver=0.1.17
pkgrel=1
pkgdesc='Simple, fast, safe language created for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
optdepends=('glfw' 'libfreetype.so' 'libcurl.so')
conflicts=('v' 'vlang-git')
source=("v-$pkgver.tar.gz::https://github.com/$pkgname/v/archive/$pkgver.tar.gz"
        "vc-$pkgver.tar.gz::https://github.com/$pkgname/vc/archive/$pkgver.tar.gz") 

prepare() {
    cp vc-$pkgver/v.c v-$pkgver/
}

build() {
    cd v-$pkgver
    cc -std=gnu11 $CFLAGS -w -o v v.c -lm $LDFLAGS
    make thirdparty-release
}

package() {
    cd v-$pkgver
    install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang" "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 v "$pkgdir/usr/lib/vlang"
    cp -a examples "$pkgdir/usr/share/vlang/"
    cp -a thirdparty "$pkgdir/usr/lib/vlang/"
    cp -a vlib "$pkgdir/usr/lib/vlang/"
    ln -s /usr/lib/vlang/v "$pkgdir/usr/bin/v"
}

sha256sums=('8c509b157e3faafac5556e124575b8d82c0441b4b45edc45bfb6c4b05d394d2b'
            '2cf184f70315dd12a23d7ddb4df665f108e5aaf7fcf2253530b76bb8ce0b8b13')

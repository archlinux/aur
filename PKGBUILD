# Maintainer: whoami <whoami@systemli.org>

pkgname=vlang
pkgver=0.1.19
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

sha256sums=('7fa2b45f88e5653b82ce92532c2cc7631f7646c8eec24763757d62657115be6a'
            '5afaaff3d041fc8629c6ffaf8cc66266274fdabc5cb2a8a588a218f985a0cc9b')

# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=bazel-compile-commands
pkgver=0.22.4
pkgrel=1
pkgdesc='Compile databases from a Bazel workspace.'
arch=('aarch64' 'x86_64')
url='https://github.com/kiron1/bazel-compile-commands'
license=('Custom')
depends=('gcc-libs')
makedepends=('bazel' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgname}-v${pkgver}.tar.gz"
        "https://github.com/bazelbuild/bazel/releases/download/8.6.0/bazel-8.6.0-linux-x86_64")
sha256sums=('a6065041d99f2621bbb842b935a299eda9a660febeeda279f38109e427815ee5'
            '9860da9c9386bbc023feed8f43af3105d338727d77b644fa6aeca45a4a11957c')

prepare() {
    chmod +x bazel-8.6.0-linux-x86_64
}

build() {
    cd "$pkgname-$pkgname-v$pkgver"
    ../bazel-8.6.0-linux-x86_64 build --config=gnu //bcc:bazel-compile-commands
}

package() {
    cd "$pkgname-$pkgname-v$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin" bazel-bin/bcc/bazel-compile-commands
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt 
}

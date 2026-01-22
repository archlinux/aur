# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=4cc
pkgver=4.1.8
pkgrel=1
pkgdesc="4coder Community"
arch=('x86_64')
url="https://github.com/4coder-community/4cc"
license=('MIT')
depends=(alsa-lib fontconfig freetype2 libx11 libxfixes)
makedepends=(zip)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('6e0f02f5d2f8a8b8afcabb5253140803f4d474f07a559ad722ebbc17f03c866edaf241ad06350534f023fb5cb956f1bdfbbe8f3a3459b2a487556d4ef10ea0c0')

build() {
    cd $pkgname-$pkgver/code
    ./bin/package-linux.sh
}

package() {
    cd $pkgname-$pkgver/current_dist_super_x64

    install -dm755 "$pkgdir/opt"
    cp -a 4coder "$pkgdir/opt/4coder"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/4coder/4ed" "$pkgdir/usr/bin/4ed"
    rm "$pkgdir/opt/4coder/audio_test/chtulthu.wav" # 32 MiB just for this file are frankly too much

    install -Dm644 4coder/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

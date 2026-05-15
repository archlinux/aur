# Maintainer: kondzii14 <dabrowskiii.kacper@gmail.com>
pkgname=cheetahfetch
pkgver=1.0.2
pkgrel=1
pkgdesc="Blazing fast system info fetch tool written in C with inline x86-64 ASM"
arch=('x86_64')
url="https://github.com/kondzii14/cheetah-fetch"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    # Musisz wejść do folderu linux, bo tam jest Makefile
    cd "cheetah-fetch-main/linux"
    make
}

package() {
    # Tu tak samo - pliki binarne i README są w podfolderach
    cd "cheetah-fetch-main/linux"

    # Install binary
    install -Dm755 cheetahfetch "$pkgdir/usr/bin/cheetahfetch"

    # cfetch symlink
    ln -sf /usr/bin/cheetahfetch "$pkgdir/usr/bin/cfetch"

    # License (zakładając, że LICENSE jest w głównym folderze)
    cd ..
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


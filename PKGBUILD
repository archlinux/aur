# Maintainer: bgkillas <bgkillas@gmail.com>
pkgname=p7zip-jinfeihan57-git
pkgdesc="Command-line file archiver with high compression ratio - jinfeihan57 fork"
pkgver=17.02_r250.a666ee0
pkgrel=1
arch=('x86_64')
makedepends=('git')
depends=()
optdepends=()
provides=('p7zip')
conflicts=('p7zip')
url="https://github.com/jinfeihan57/p7zip"
license=('GNU LGPL')
source=('git+https://github.com/jinfeihan57/p7zip.git'
        '7z')
sha512sums=('SKIP'
            'SKIP')
build () {
cd p7zip
make 7z
}
pkgver() {
cd p7zip
echo $(sed 'x;$!d;s/.*VERSION\ \"//;s/".*//' C/7zVersion.h)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
package() {
mkdir -p "$pkgdir/usr/lib/p7zip/Codecs"
mkdir -p "$pkgdir/usr/bin"
install -Dm755 "7z" "$pkgdir/usr/bin/"
install -Dm755 "$srcdir/p7zip/bin/7z" "$pkgdir/usr/lib/p7zip/"
install -Dm755 "$srcdir/p7zip/bin/7z.so" "$pkgdir/usr/lib/p7zip/"
install -Dm755 "$srcdir/p7zip/bin/Codecs/Rar.so" "$pkgdir/usr/lib/p7zip/Codecs"
}
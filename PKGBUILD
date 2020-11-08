# Maintainer: Owen D'Aprile <aur@owen.sh>

pkgname=utf8info-git
pkgver=r36.f69321e
pkgrel=1
pkgdesc='Small utility that reads a UTF-8 stream and prints out the raw codepoint information.'
arch=('x86_64')
url=https://github.com/lunasorcery/utf8info
license=('unknown')
makedepends=('curl')
source=("$pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    sed -i "s|@unzip|@unzip -o|g" "$pkgname"/Makefile
}

build() {
    make --directory "$pkgname"
}

package() {
    install -Dm755 "$pkgname/bin/utf8info" "$pkgdir/usr/bin/utf8info"
}

# Maintainer: whoami <whoami@systemli.org>

pkgname=vlang-git
pkgver=r44.4e24681
pkgrel=1
pkgdesc='Simple, fast, safe language created for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
depends=('glfw' 'libfreetype.so' 'libcurl.so')
conflicts=('v')
source=('git+https://github.com/vlang/v.git'
        'https://vlang.io/v.c')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "v"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "v/compiler"
    сс -w -o vc v.c
    ./vc -o v .
}

package() {
    cd "v"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 v "$pkgdir/usr/bin/v"
    install -d "$pkgdir/usr/lib/v"
    cp -a vlib "$pkgdir/usr/lib/v"
}

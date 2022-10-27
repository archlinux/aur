# Maintainer: laniku <laniku@envs.net>
# Maintainer: segfaultdev <segfaultdev@proton.me> 

pkgname=tree-game
pkgver=0.11
pkgrel=3
pkgdesc="Powder toy like sandbox game focused on nature"
url="https://github.com/segfaultdev/tree"
arch=('x86_64')
license=('MIT')
depends=('libglvnd')
source=(
  "https://github.com/segfaultdev/tree/archive/refs/tags/v0.11.tar.gz"
  tree-game.desktop
  "https://raw.githubusercontent.com/segfaultdev/tree/master/LICENSE"
)
md5sums=(
  '9949062378aa096fe5a4b69399c37b29'
  'ef12d3faa5abcb030f5ceb1fddef5bdb'
  '46c1610e7dad80dfca885fc076d8a545'
)

build() {
    cd "${srcdir}/tree-0.11"
    gcc -O3 $(find . -name "*.c") -Llib -Iinclude -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o tree
}

package() {
    # Copy executable and make it runnable
    install -D -m755 \
        "${srcdir}/tree-0.11/tree" \
        "${pkgdir}/usr/bin/${pkgname}"
    

    # Desktop Environment integration
    install -D -m644 \
        "${srcdir}/tree-game.desktop" \
        "${pkgdir}/usr/share/applications/tree-game.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

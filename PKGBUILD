# Maintainer: Lucas Puntillo <laniku@envs.net>

pkgname=tree-game
pkgver=0.11
pkgrel=1
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
sha256sums=(
  '3cc26c514fbbfbfdf85db5dbcc3a5eb02a6db71dfbc135ce5a482925090c0e91'
  '9c6638d0971105517fbb244d7c00220fb34786597d6107fb6172b11008a1a018'
  'e52bc9b76627c882c7f65113d57b8874062ac647e7a720a8b5ca7be3cad5a205'
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

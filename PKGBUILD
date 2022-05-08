# Maintainer: Lucas Puntillo <laniku@envs.net>

pkgname=tree-game
pkgver=0.10
pkgrel=2
pkgdesc="Powder toy like sandbox game focused on nature"
url="https://github.com/segfaultdev/tree"
arch=('x86_64')
license=('MIT')
depends=('libglvnd')
source=(
  "https://github.com/segfaultdev/tree/archive/refs/tags/v0.10.tar.gz"
  tree-game.desktop
  "https://raw.githubusercontent.com/segfaultdev/tree/master/LICENSE"
)
sha256sums=(
  'a63215504502002f442bcd7281bcd4f88fdbf1a1065e667d676c38c56eb8edef'
  '9c6638d0971105517fbb244d7c00220fb34786597d6107fb6172b11008a1a018'
  '78f3201cff6e5a760db10ce3d7456f0f0a9c130fe132095d90f3eb16cb6296ea'
)

build() {
    cd "${srcdir}/tree-0.10"
    gcc -O1 $(find . -name "*.c") -Llib -Iinclude -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o tree
}

package() {
    # Copy executable and make it runnable
    install -D -m755 \
        "${srcdir}/tree-0.10/tree" \
        "${pkgdir}/usr/bin/${pkgname}"
    

    # Desktop Environment integration
    install -D -m644 \
        "${srcdir}/tree-game.desktop" \
        "${pkgdir}/usr/share/applications/tree-game.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

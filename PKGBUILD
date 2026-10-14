# Maintainer: João Gabriel V. Melão <jgvasconcellos22@gmail.com>

pkgname=docker-native-manager-bin
pkgver=1.17.0
pkgrel=2
pkgdesc="Native Docker Desktop alternative for Linux"
arch=('x86_64')
url="https://github.com/pedrofariasx/dockernativemanager"
license=('MIT')

depends=(
    gtk3
    webkit2gtk-4.1
)

options=('!strip' '!debug')

source=(
    "Docker.Native.Manager_${pkgver}_amd64.deb::https://github.com/pedrofariasx/dockernativemanager/releases/download/v${pkgver}/Docker.Native.Manager_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/pedrofariasx/dockernativemanager/main/LICENSE"
)

sha256sums=(
    '63fffaa08928c913be9500fd7235a20c1ea14f2922c9aa0158b30a780e9e0ea2'
    'SKIP'
)

check() {
    ar t "Docker.Native.Manager_${pkgver}_amd64.deb" >/dev/null
}

package() {
    cd "$srcdir"

    # Extrai o conteúdo do pacote .deb
    bsdtar -xOf "Docker.Native.Manager_${pkgver}_amd64.deb" data.tar.gz \
        | bsdtar -xf - -C "$pkgdir"

    # Instala a licença
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

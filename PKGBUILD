# Maintainer: João Gabriel V. Melão <jgvasconcellos22@gmail.com>

pkgname=docker-native-manager-bin
pkgver=1.18.1
pkgrel=1
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

sha256sums=('1080664d84941a05cf94da4ae1203b1341efb6d214e311a6255e321b8ada6c70'
            '0d93996f2338981b6a5e11eadf77c832f482c9523447d9e7952080e18db94cea')

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

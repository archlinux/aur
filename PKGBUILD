# Maintainer: João Gabriel V. Melão <jgvasconcellos22@gmail.com>

pkgname=docker-native-manager-bin
pkgver=1.15.2
pkgrel=1
pkgdesc="Native Docker Desktop alternative for Linux"
arch=('x86_64')
url="https://github.com/pedrofariasx/dockernativemanager"
license=('MIT')

depends=(
    cairo
    gdk-pixbuf2
    glib2
    gtk3
    hicolor-icon-theme
    libsoup3
    webkit2gtk-4.1
)

options=('!strip' '!debug')

source=(
    "Docker.Native.Manager_${pkgver}_amd64.deb::https://github.com/pedrofariasx/dockernativemanager/releases/download/v${pkgver}/Docker.Native.Manager_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/pedrofariasx/dockernativemanager/main/LICENSE"
)

sha256sums=(
    '3860c0bf3d7db59b6bd03e6c6242882a55ac337bd0330a7d69291dde8fee236d'
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

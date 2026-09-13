# Maintainer: João Gabriel V. Melão <jgvasconcellos22@gmail.com>

pkgname=docker-native-manager-bin
pkgver=1.16.1
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
    '07a25736c59b3fcaa9f3916b798e58573745fdd60445dedad48c340a5a12d8a0'
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

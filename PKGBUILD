# Maintainer: João Pedro Oliveira <oliveira.joao@unifesp.br>

pkgname='wiredpanda'
pkgver=4.2.6
pkgrel=1
pkgdesc="Software designed to help students learn about logic circuits and simulate them in an easy and friendly way."
arch=('x86_64')
url="https://gibis-unifesp.github.io/wiRedPanda/"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg')
makedepends=('git' 'make' 'qt5-base' 'qt5-svg')
source=("$pkgname::git+https://github.com/GIBIS-UNIFESP/wiRedPanda.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    qmake ../WPanda.pro
    make
}

package() {
    cd "$srcdir/$pkgname/build"

    # Instala o executável principal
    install -Dm755 "app/wiredpanda" "$pkgdir/usr/bin/wiredpanda"

    # Instala o ícone da aplicação no diretório padrão de ícones
    install -Dm644 "$srcdir/$pkgname/app/resources/wpanda.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/wiredpanda.svg"

    # Instala o arquivo de licença
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Este arquivo permite que a aplicação apareça no menu de programas.
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/wiredpanda.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=wiRedPanda
Comment=${pkgdesc}
Exec=wiredpanda
Icon=wiredpanda
Terminal=false
Categories=Education;Electronics;Science;
EOF
}

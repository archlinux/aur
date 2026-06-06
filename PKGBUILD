# Maintainer: João Pedro Oliveira <oliveira.joao@unifesp.br>

pkgname=wiredpanda
pkgver=5.1.2
pkgrel=1
pkgdesc="Software designed to help students learn about logic circuits and simulate them in an easy and friendly way"
arch=('x86_64')
url="https://gibis-unifesp.github.io/wiRedPanda/"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GIBIS-UNIFESP/wiRedPanda/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

build() {
    cd "wiRedPanda-${pkgver}"
    cmake --preset release
    cmake --build --preset release
}

package() {
    cd "wiRedPanda-${pkgver}"
    
    # Install main executable
    install -Dm755 build/wiredpanda "$pkgdir/usr/bin/wiredpanda"

    # Install application icon
    install -Dm644 App/Resources/Assets/Logos/wpanda.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wiredpanda.svg"

    # Install license file
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/wiredpanda.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=wiRedPanda
Comment=$pkgdesc
Exec=wiredpanda %F
Icon=wiredpanda
Terminal=false
Categories=Education;Electronics;Science;
MimeType=application/x-wiredpanda;
EOF
}

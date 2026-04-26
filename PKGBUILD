# Maintainer: João Pedro Oliveira <oliveira.joao@unifesp.br>

pkgname=wiredpanda
pkgver=5.0.1
pkgrel=1
pkgdesc="Software designed to help students learn about logic circuits and simulate them in an easy and friendly way"
arch=('x86_64')
url="https://gibis-unifesp.github.io/wiRedPanda/"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja')
# Using git with specific commit hash for version 5.0.1 (no git tag available)
_commit=410ae117d45864d8828af27cad5adbd1a8e79d0d
source=("$pkgname-$pkgver.tar.gz::https://github.com/GIBIS-UNIFESP/wiRedPanda/archive/${_commit}.tar.gz")
sha256sums=('53540432928a030b51ffd36b2d21ac3ef5b2fa6bbb9abe478e344ef818319cca')

build() {
    cd "wiRedPanda-${_commit}"
    cmake --preset release
    cmake --build --preset release
}

package() {
    cd "wiRedPanda-${_commit}"
    
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

# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=graviton-bin
pkgver=2.0.92
pkgrel=1
pkgdesc='A modern Code Editor'
arch=('x86_64')
url='https://graviton.netlify.app/'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=("graviton")
conflicts=("graviton")

source=("https://github.com/Graviton-Code-Editor/Graviton-App/releases/download/${pkgver}/GravitonEditor_Installer_${pkgver}_linux.deb"
        "https://raw.githubusercontent.com/Graviton-Code-Editor/Graviton-App/master/LICENSE.md")

sha256sums=('f0ee02e9e58c18ad745d1d4e20759930ec1e0ee96d55c88cc6bf44851f55f33e'
            'SKIP')

package() {
    # Install 
    cd "$srcdir"
    tar -xJf data.tar.xz -C "$pkgdir"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/Graviton/graviton "$pkgdir/usr/bin/graviton"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed -i 's,/opt/Graviton/graviton %U,/usr/bin/graviton %F,g' "$pkgdir/usr/share/applications/graviton.desktop"
}

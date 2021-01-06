# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=graviton-bin
pkgver=2.1.6
pkgrel=1
pkgdesc='A modern Code Editor'
arch=('x86_64')
url='https://graviton.netlify.app/'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=("graviton")
conflicts=("graviton")

source=("https://github.com/Graviton-Code-Editor/Graviton-App/releases/download/v${pkgver}/GravitonEditor_Installer_${pkgver}_linux.deb"
        "https://raw.githubusercontent.com/Graviton-Code-Editor/Graviton-App/master/LICENSE.md")

sha256sums=('32082a5376280767b1d7f82a3667e9c9577951c29350261ee55b40632612816f'
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

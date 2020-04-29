# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=graviton-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A modern Code Editor'
arch=('x86_64')
url='https://graviton.netlify.app/'
license=('MIT')
depends=('libappindicator-gtk3' 'libdbusmenu-gtk3' 'libindicator-gtk3')
provides=("graviton")
conflicts=("graviton")
options=('!strip')

source=("https://github.com/Graviton-Code-Editor/Graviton-App/releases/download/$pkgver/Graviton-$pkgver-amd64-linux.deb"
        "https://raw.githubusercontent.com/Graviton-Code-Editor/Graviton-App/master/LICENSE.md")

sha256sums=('83623f135a8610b75e482e661492b17f52057288c936af9baf86447082d23927'
            'SKIP')

package() {
    # Install 
    cd "$srcdir"
    tar -xJf data.tar.xz -C "$pkgdir"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/Graviton/graviton "$pkgdir/usr/bin/graviton"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed -i 's,/opt/Graviton/graviton %U,graviton %F,g' "$pkgdir/usr/share/applications/graviton.desktop"
}

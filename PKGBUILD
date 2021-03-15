# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=graviton-bin
pkgver=2.2.6
pkgrel=1
pkgdesc='A modern Code Editor'
arch=('x86_64')
url='https://graviton.netlify.app/'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=("graviton")
conflicts=("graviton")

source=("https://github.com/Graviton-Code-Editor/Graviton-App/releases/download/v${pkgver}/Graviton.Editor_Installer_${pkgver}_linux_amd64.deb"
        "https://raw.githubusercontent.com/Graviton-Code-Editor/Graviton-App/master/LICENSE.md")

sha256sums=('df083b0485dbf4efe1b23f12a10ffbe5af2e42fb5c2a4cd044f7e1f4f9b7bf9b'
            'SKIP')

package() {
    # Install 
    cd "$srcdir"
    tar -xJf data.tar.xz -C "$pkgdir"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Graviton Editor/graviton" "$pkgdir/usr/bin/graviton"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed -i 's,^Exec="/opt/Graviton Editor/graviton" %U$,Exec=/usr/bin/graviton %F,g' "$pkgdir/usr/share/applications/graviton.desktop"
}

pkgname=pollen-bin
pkgver=0.0.0
pkgrel=2
pkgdesc='Pollen'
arch=('x86_64')
url='https://github.com/tiouoo/Pollen'
license=('AGPL-3.0-or-later')
depends=('fuse2' 'hicolor-icon-theme' 'xdg-utils')
conflicts=('pollen-commit-bin' 'pollen-nightly-bin' 'pollen-commit' 'pollen-nightly' )
options=('!strip' '!emptydirs')
_appimg="Pollen-${pkgver}.AppImage"
source_x86_64=("$_appimg::https://github.com/tiouoo/Pollen/releases/download/v0.0.0/Pollen.linux.x64.AppImage" 'pollen.png' 'pollen.desktop' 'LICENSE')
sha256sums_x86_64=('2d07bbc535f7f80da2287d72632d6c83a8b15e4600ca569008f1d8256831dd0f' 'SKIP' 'SKIP' 'SKIP')
noextract=("$_appimg")

package() {
    install -Dm755 "$srcdir/$_appimg" "$pkgdir/opt/pollen/Pollen.AppImage"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/pollen" <<'EOF'
#!/bin/sh
exec /opt/pollen/Pollen.AppImage "$@"
EOF
    install -Dm644 "$srcdir/pollen.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pollen.png"
    install -Dm644 "$srcdir/pollen.desktop" "$pkgdir/usr/share/applications/pollen.desktop"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

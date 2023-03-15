# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: webmeister <aur -dot- 20 -dot- webmeister -at- spamgourmet -dot- com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=mu-editor
epoch=1
pkgver=1.2.0
pkgrel=3
pkgdesc='A simple Python editor for beginner programmers'
arch=('x86_64')
url='https://codewith.mu/'
license=('GPL3')
depends=('libxcrypt-compat' 'fuse2')
makedepends=('gendesk')
source=("Mu_Editor-$pkgver.AppImage::https://github.com/mu-editor/mu/releases/download/v1.2.0/MuEditor-Linux-1.2.0-x86_64.AppImage" "mueditor.png::https://codewith.mu/img/brand.png")
sha256sums=('1a302a772dcc60b6353e44e4cc772a37fec7238c573bbb88d01ed7f6fcbf6abe' '8edbaf68c5982341aa2973136c90e6e985f4f86ed6bb69997abee3b7619e5e52')
options=(!strip)

build() {
  cd "$srcdir/"
  gendesk -f -n \
     --pkgname=$pkgname \
     "--pkgdesc=$pkgdesc" \
     "--name=Mu" \
     "--genericname=Code Editor" \
     "--categories=Application;Development;TextEditor" \
     "--icon=mueditor.png" \
     --exec=/opt/mu-editor/Mu_Editor-$pkgver.AppImage \
     --terminal=false \
     --startupnotify=true \
     "--mimetypes=text/x-python;text/x-python3"
}

package() {
    mkdir -p "$pkgdir/opt/mu-editor/"
    install -Dm644 "$srcdir/Mu_Editor-$pkgver.AppImage" "$pkgdir/opt/mu-editor/Mu_Editor-$pkgver.AppImage"
    chmod +x "$pkgdir/opt/mu-editor/Mu_Editor-$pkgver.AppImage"

    mkdir -p "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/mu-editor.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/mueditor.png" "$pkgdir/usr/share/pixmaps/"
}

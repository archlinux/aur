# Maintainer: Pc0stas <pablocostasnieto@gmail.com>
# Repack del .deb que genera el CI. No se compila en el build porque `bun install`
# necesitaría red, y AUR no lo permite.
pkgname=epoch-app-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Archivo personal de la web: guarda el HTML de una página para volver a verla como estaba"
arch=('x86_64')
url="https://github.com/PC0staS/epoch"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
source=("epoch_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/epoch_${pkgver}_amd64.deb")
sha256sums=('66bb06fd8711d4372ecca10120575bc5539150842702b0fea59dd53b6120c04c')

package() {
  bsdtar -xf "$srcdir/epoch_${pkgver}_amd64.deb" -C "$srcdir"
  bsdtar -xf "$srcdir"/data.tar.* --no-same-owner -C "$pkgdir"

  # El .desktop que genera Tauri sale con Name=epoch y un Comment de plantilla.
  sed -i -e 's/^Name=.*/Name=Epoch/' \
    -e 's/^Comment=.*/Comment=Archivo personal de la web/' \
    "$pkgdir/usr/share/applications/epoch.desktop"
}

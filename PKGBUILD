# Maintainer: Pc0stas <pablocostasnieto@gmail.com>
# Repack del .deb que genera el CI. No se compila en el build porque `bun install`
# necesitaría red, y AUR no lo permite.
pkgname=epoch-app-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Archivo personal de la web: guarda el HTML de una página para volver a verla como estaba"
arch=('x86_64')
url="https://github.com/PC0staS/epoch"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
source=("epoch_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/epoch_${pkgver}_amd64.deb")
sha256sums=('0f83e922ec57a530e1ff99949a9013773bcfaf42631bb20c42d60fe870e32f6d')

package() {
  bsdtar -xf "$srcdir/epoch_${pkgver}_amd64.deb" -C "$srcdir"
  bsdtar -xf "$srcdir"/data.tar.* --no-same-owner -C "$pkgdir"

  # El .desktop que genera Tauri sale con Name=epoch y un Comment de plantilla.
  sed -i -e 's/^Name=.*/Name=Epoch/' \
    -e 's/^Comment=.*/Comment=Archivo personal de la web/' \
    "$pkgdir/usr/share/applications/epoch.desktop"
}

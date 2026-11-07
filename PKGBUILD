# Maintainer: Pc0stas <pablocostasnieto@gmail.com>
# Repack del .deb que genera el CI. No se compila en el build porque `bun install`
# necesitaría red, y AUR no lo permite.
pkgname=epoch-app-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Archivo personal de la web: guarda el HTML de una página para volver a verla como estaba"
arch=('x86_64')
url="https://github.com/PC0staS/epoch"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
source=("epoch_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/epoch_${pkgver}_amd64.deb")
sha256sums=('42c48eb5d663978e10aa6f055bcdd52d8e10ec3f2059f3c66b28b2029523e3f3')

package() {
  bsdtar -xf "$srcdir/epoch_${pkgver}_amd64.deb" -C "$srcdir"
  bsdtar -xf "$srcdir"/data.tar.* --no-same-owner -C "$pkgdir"

  # El .desktop que genera Tauri sale con Name=epoch y un Comment de plantilla.
  sed -i -e 's/^Name=.*/Name=Epoch/' \
    -e 's/^Comment=.*/Comment=Archivo personal de la web/' \
    "$pkgdir/usr/share/applications/epoch.desktop"
}

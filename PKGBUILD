pkgname=rdesk-util-bin
pkgver=1
pkgrel=1
pkgdesc="A simple and modern GUI for remote desktop administration over the LAN."
arch=('x86_64')
url="https://github.com/mijocecr/rdesk-util"
license=('MIT')

depends=(
  'glibc'
  'gcc-libs'
  'wayland'
  'xdg-desktop-portal' # captura de pantalla y control de escritorio
  'pipewire'           # transporte de frames
  'libei'              # inyeccion de raton/teclado en el host
)

optdepends=(
  'xdg-desktop-portal-kde: portal de escritorio en KDE'
  'xdg-desktop-portal-gtk: portal de escritorio en GTK'
)

options=('!debug' '!strip')

source=("https://github.com/mijocecr/rdesk-util/releases/download/rdesk-util_v1/RDESK-Util.tar.gz")
sha256sums=('1913e285667f0c35dec0179e6344852eeaac4c549330d6318399bba375a631ec')

package() {
  install -d "$pkgdir/usr/lib/rdesk-util"

  # Copiar el contenido del tarball excluyendo el propio archivo fuente.
  find "$srcdir" -maxdepth 1 ! -name '.' ! -name '..' ! -name 'RDESK-Util.tar.gz' \
    -exec cp -r {} "$pkgdir/usr/lib/rdesk-util/" \;

  chmod +x "$pkgdir/usr/lib/rdesk-util/RDESK-Util"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/rdesk-util/RDESK-Util "$pkgdir/usr/bin/rdesk-util"

  install -Dm644 "$srcdir/rdesk-util.desktop" "$pkgdir/usr/share/applications/rdesk-util.desktop"
  install -Dm644 "$srcdir/rdesk-util.png" "$pkgdir/usr/share/pixmaps/rdesk-util.png"
}

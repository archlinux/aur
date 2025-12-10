pkgname=iscsi-util
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
license=('MIT')
depends=('dotnet-runtime')
source=("https://github.com/mijocecr/Iniciador-iSCSI-GUI-Manjaro/releases/download/iscsi-util/ISCSI-Util.tar.gz"
        "iscsi-util.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
  # Crear directorio para librerías
  install -d "$pkgdir/usr/lib/iscsi-util"

  # Copiar binario y dependencias
  install -Dm755 "$srcdir/ISCSI-Util" "$pkgdir/usr/lib/iscsi-util/ISCSI-Util"
  install -Dm644 "$srcdir"/*.dll "$pkgdir/usr/lib/iscsi-util/"
  install -Dm644 "$srcdir"/*.json "$pkgdir/usr/lib/iscsi-util/"
  cp -r "$srcdir/runtimes" "$pkgdir/usr/lib/iscsi-util/"

  # Crear directorio para binarios y enlace simbólico
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/iscsi-util/ISCSI-Util "$pkgdir/usr/bin/iscsi-util"

  # Integración con el sistema
  install -Dm644 "$srcdir/iscsi-util.desktop" "$pkgdir/usr/share/applications/iscsi-util.desktop"
  install -Dm644 "$srcdir/iscsi-util.png" "$pkgdir/usr/share/pixmaps/iscsi-util.png"
}

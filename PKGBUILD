# Maintainer: mickael9 <mickael9 at gmail dot com>
pkgname=pololu-maestro
pkgver=220509
_fileid=0J315
pkgrel=1
pkgdesc="Pololu Maestro Control Center"
arch=(i686 x86_64)
url="http://www.pololu.com/docs/0J40/3.b"
license=('unknown')
depends=('mono')

source=("maestro_linux_${pkgver}.tar.gz::http://www.pololu.com/file/download/maestro_linux_${pkgver}.tar.gz?file_id=${_fileid}"
        "UscCmd"
        "MaestroControlCenter")

sha256sums=('39c758838704464db829fadc0c5d78698ab21b0dc816fd7555cda611b80cf756'
            '6d6b794b78e55809c6c6f71fa80c72ad88a012bce5eeb4d71c9eb93019fe3d1f'
            'bec46aeaf69f6f547c867d8fc989eec3e43f8bce944d68ba99ad25e74581f641')

package() {
  cd "$srcdir/maestro-linux"

  install -D "99-pololu.rules" "${pkgdir}/etc/udev/rules.d/99-pololu.rules"
  rm "99-pololu.rules"
  
  install -d "${pkgdir}/usr/lib/maestro_linux/"
  install -t "${pkgdir}/usr/lib/maestro_linux/" *

  install -d "${pkgdir}/usr/bin"
  install -t "${pkgdir}/usr/bin" "${srcdir}/UscCmd"
  install -t "${pkgdir}/usr/bin" "${srcdir}/MaestroControlCenter"
}

# vim:set ts=2 sw=2 et:

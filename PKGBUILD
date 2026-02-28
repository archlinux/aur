# Maintainer: AeCw <aecbanana@outlook.com>
pkgname=lenovo-print-driver-lj2400-m7400-bin
pkgver=5.0.3
pkgrel=1
pkgdesc="Lenovo cups printer drivers for LJ2400Pro LJ2405 LJ2405D LJ2605D LJ2655DN LJ2680DN M7400Pro M7400W M7405D M7405DW M7450FPro M7455DNF M7460 M7480 M7490DNF M7605D M7605DW M7615DNA M7625DWA M7626DNA M7628DNA M7655DHF M7675DXF M7680D M7685DXF M7686DXF lenovo-M7690DNA series and compatibles"
arch=('x86_64')
url="https://www.lenovo.com"
license=('custom:lenovo')
depends=('cups' 'glibc' 'perl' 'bash' 'coreutils' 'findutils')
optdepends=('python: for additional printer management scripts')

install=lenovo-print-driver.install

source=(
    "drive-service_signed_com.lenovo.lenovoprints_5.0.3-2_amd64.deb"
    "lenovo-print-driver.install"
)
sha256sums=('17da4287011a53118f34f2af8d7e39af162b554d33d6a86c78f56507d4ae9a8f'
            'c526ad2319c9c9b7e04ab1c594f67df47f200330d1e0c95757dc5ab2263ae722')

package() {
  cd "$srcdir"
  
  bsdtar -xf "drive-service_signed_com.lenovo.lenovoprints_5.0.3-2_amd64.deb" -C "$pkgdir"
  for datafile in data.tar.*; do
    if [ -f "$datafile" ]; then
      tar -xf "$datafile" -C "$pkgdir"
    fi
  done
  rm -f control.tar.* debian-binary data.tar.* 2>/dev/null
  
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir/opt/lenovo/com.lenovo.lenovoprints/bin" -type f -exec chmod 755 {} \;
  
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/cups/filter"
  install -dm755 "$pkgdir/usr/lib32/cups/filter"
  install -dm755 "$pkgdir/usr/libexec/cups/filter"
  install -dm755 "$pkgdir/var/spool/lpd"
  
}

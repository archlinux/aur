# Maintainer: Olivier Le Moal <mail olivierlemoal fr>

pkgname=uefi-firmware-parser-git
pkgver=v1.8.r9.g4262dbb
pkgrel=1
pkgdesc='Parse BIOS/Intel ME/UEFI firmware related structures: Volumes, FileSystems, Files, etc'
arch=(i686 x86_64)
license=(MIT)
url='https://github.com/theopolis/uefi-firmware-parser'
depends=(python)
conflicts=('uefi-firmware-parser')
provides=('uefi-firmware-parser')
makedepends=(python-setuptools)
source=(uefi-firmware-parser::git+https://github.com/theopolis/uefi-firmware-parser#branch=master)
sha1sums=('SKIP')

pkgver() {
  cd uefi-firmware-parser
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd uefi-firmware-parser
  python setup.py install --root="$pkgdir" --optimize=1

  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" scripts/{fv_injector.py,fv_parser.py,uefi_guids.py,contrib/dell_extract_hdr.py}
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=uefi-firmware-parser
pkgver=1.3
pkgrel=1
pkgdesc='Parse BIOS/Intel ME/UEFI firmware related structures: Volumes, FileSystems, Files, etc'
arch=(i686 x86_64)
license=(MIT)
url='https://github.com/theopolis/uefi-firmware-parser'
depends=(python2)
makedepends=(python2-setuptools)
source=(uefi-firmware-parser-$pkgver.zip::https://github.com/theopolis/uefi-firmware-parser/archive/v$pkgver.zip)
sha1sums=('63892fb329a4f518e54f68ea66b478981802f4ed')

prepare() {
  cd uefi-firmware-parser-$pkgver
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\b|#!/usr/bin/env python2|' {} \;
}

package() {
  cd uefi-firmware-parser-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" scripts/{fv_injector.py,fv_parser.py,uefi_guids.py,contrib/dell_extract_hdr.py}
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

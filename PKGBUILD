pkgname=7zip-zstd-bin
pkgver=25.01
_pkgver=1.5.7-R4
pkgrel=1
pkgdesc="File archiver for extremely high compression (With Zstandard support)"
arch=('x86_64' 'aarch64')
url="https://github.com/mcmilk/7-Zip-zstd"
license=('LGPL-2.1-or-later' 'BSD-3-Clause' 'LicenseRef-UnRAR')
depends=('glibc' 'gcc-libs')
provides=('p7zip' '7zip' '7zip-zstd')
conflicts=('p7zip' '7zip' '7zip-zstd')

source_x86_64=("${url}/releases/download/v${pkgver}-v${_pkgver}/linux-gcc-x64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}-v${_pkgver}/linux-gcc-arm64.zip")
source=("License.txt::${url}/raw/master/DOC/License.txt"
        "unRarLicense.txt::${url}/raw/master/DOC/unRarLicense.txt")

sha256sums=('5be3ae4796171027f3a2a631a22ed6333c4ebae38de47851b2fc3f24baa0fcd0'
            '17bd9fa4399092c777536fff045b41df76ec9d2ac4c9b8e7345d3b8b6ccc7976')
sha256sums_x86_64=('b7526802535bf98d6268ce1960de7e36cf8ed6b4004c9ba3ac09db9e14d9a20d')
sha256sums_aarch64=('fd8adcc02f17a6a4af861aed59a2c7faba4349dbfcb70844f777e803fb246edb')


package() {
  cd "$srcdir"

  install -Dt "$pkgdir/usr/lib/7zip" 7z 7za 7zr 7z.so 

  local _prog
  for _prog in 7za 7zr 7z; do
    printf '#!/bin/sh\nexec /usr/lib/7zip/%s "$@"\n' "$_prog" \
      | install -D /dev/stdin "$pkgdir/usr/bin/$_prog"
  done
  
  install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/License.txt"
  install -Dm644 "$srcdir/unRarLicense.txt" "$pkgdir/usr/share/licenses/$pkgname/unRarLicense.txt"
 }

# vim:set ts=2 sw=2 et:

pkgname=7zip-zstd-bin
pkgver=26.01
_pkgver=1.5.7-R1
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

sha256sums=('5b565f1591a5872cb163a17a06725c4ec010f60401c9068d1b5e1e8c89517f39'
            '17bd9fa4399092c777536fff045b41df76ec9d2ac4c9b8e7345d3b8b6ccc7976')
sha256sums_x86_64=('3cfca42ab44519822d5299cb92f823633209dd762d903ade3fde19585c56915a')
sha256sums_aarch64=('b0fe7971ac821524b68cdf6821357a36a978a80495d054b76a42fe3aa2dc290c')


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

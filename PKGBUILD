pkgname=7zip-zstd-bin
pkgver=26.02
_pkgver=1.5.7-R2
pkgrel=2
pkgdesc="File archiver for extremely high compression (With Zstandard support)"
arch=('x86_64' 'aarch64')
url="https://github.com/mcmilk/7-Zip-zstd"
license=('LGPL-2.1-or-later' 'BSD-3-Clause' 'LicenseRef-UnRAR')
depends=('glibc' 'gcc-libs')
provides=('p7zip' '7zip' '7zip-zstd')
conflicts=('p7zip' '7zip' '7zip-zstd')
options=('!strip')

source_x86_64=("${url}/releases/download/v${pkgver}-v${_pkgver}/linux-gcc-x64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}-v${_pkgver}/linux-gcc-arm64.zip")
source=("License.txt::${url}/raw/v${pkgver}-v${_pkgver}/DOC/License.txt"
        "unRarLicense.txt::${url}/raw/v${pkgver}-v${_pkgver}/DOC/unRarLicense.txt")

sha256sums=('5b565f1591a5872cb163a17a06725c4ec010f60401c9068d1b5e1e8c89517f39'
            '17bd9fa4399092c777536fff045b41df76ec9d2ac4c9b8e7345d3b8b6ccc7976')
sha256sums_x86_64=('be246e5a284d3b5e738bad5cbb24c2662996ddb9776e09575b5099ab53fa0ba3')
sha256sums_aarch64=('64511f6ebc32d5257a535b33b21a5b6712c72aa91e28524f41e1ce92e803c909')


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

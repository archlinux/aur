# Maintainer: Daan van Rossum <d.r.vanrossum at gmx dot de>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=llpp
pkgver=22
_pkgname=${pkgname}-561dc56
pkgrel=1
pkgdesc='Lightweight, fast and featureful PDF viewer based on MuPDF'
arch=('i686' 'x86_64')
url='http://repo.or.cz/w/llpp.git'
license=('custom')
depends=('openjpeg2' 'jbig2dec' 'desktop-file-utils')
makedepends=('ocaml' 'mupdf')
source=(http://repo.or.cz/llpp.git/snapshot/561dc5673cea431e930668b0d87b0c4b31a36b39.tar.gz)
install=llpp.install
sha256sums=('SKIP')

optdepends=(
  # llpp
  'xsel: Text selection'
  # llppac
  'file: automatic file type recognition'
  "gzip: handling of MIME types 'application/x-{gzip,compress}'"
  "xz: handling of MIME type 'application/x-xz'"
  "bzip2: handling of MIME type 'application/x-bzip2'"
  'djvulibre: djvu conversion'
  'ghostscript: ps, dvi, and djvu conversion'
  'princexml: html conversion'
  'unoconv: conversion of office documents'
  'librsvg: preferred option for svg conversion'
  'inkscape: alternative option for svg conversion'
  'imagemagick: image conversion'
  'antiword: conversion of Microsoft Word (.doc) documents (option 2)'
  'zip: png and jpeg conversion'
  'texlive-core: dvi conversion'
)
options=('!strip')

build() {
  cd $_pkgname
  sed -i -e 's+-I \$srcdir/mupdf/include -I \$srcdir/mupdf/thirdparty/freetype/include+-I /usr/include/freetype2+' build.sh
  sed -i -e 's+-lopenjpeg+-lopenjp2+' build.sh
  sed -i -e 's+-L\$srcdir/mupdf/build/native ++' build.sh
  sh build.sh build/
}

package() {
  cd $_pkgname
  install -Dm755 build/llpp "$pkgdir"/usr/bin/llpp

  install -Dm0644 misc/llpp.desktop "$pkgdir"/usr/share/applications/llpp.desktop
  install -Dm0644 README "$pkgdir"/usr/share/licenses/llpp/README
}

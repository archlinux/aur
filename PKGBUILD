# Maintainer: Hikari_Nova <3044344887@qq.com>

pkgname=otf-inter-frozen
pkgver=4.1.0
pkgrel=1
pkgdesc="Inter OpenType fonts with cv05 and tnum frozen into the default mappings"
arch=('any')
url="https://github.com/KasumiNova/inter-frozen-repro"
license=('OFL-1.1-RFN')
makedepends=('python-fonttools')

_interver=4.1

source=(
  "$pkgname-$pkgver-build.py::https://raw.githubusercontent.com/KasumiNova/inter-frozen-repro/v$pkgver/build.py"
  "Inter-$_interver.zip::https://github.com/rsms/inter/releases/download/v$_interver/Inter-$_interver.zip"
)
noextract=("Inter-$_interver.zip")
sha256sums=(
  'c1642a6092dcd299f22f6ba32422642f5fe1d93edd363b866c268e811c66c4b3'
  '9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e'
)

build() {
  python "$srcdir/$pkgname-$pkgver-build.py" \
    --offline \
    --inter-archive "$srcdir/Inter-$_interver.zip" \
    --output-dir "$srcdir/output"
}

package() {
  install -Dm644 "$srcdir/output/"*.otf \
    -t "$pkgdir/usr/share/fonts/$pkgname"
  install -Dm644 "$srcdir/output/OFL-1.1.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1.txt"
}

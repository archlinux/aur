# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=4.2.4
pkgrel=1
pkgdesc='A wrapper for the lf file manager with in-terminal media previews, on-exit directory changing and much more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg graphicsmagick openslide ghostscript bat fzf dunst dialog xsel lolcat python3 python-docopt python-pillow python-attrs libxres python-setuptools python-pip tesseract tesseract-data-eng)
conflicts=(lfp-git)
optdepends=(
  'nodejs: to make use of lfps built in node actions manager'
  'python3: to make use of lfps built in python actions manager'
  )
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '430884764bec558c171dafc2bafee7fa2b3ac1f3e09c5f13e0d272f88051e4aa0cf41da0bf4311fde2801d147a5d5d4f0a2ebdec1b1d00c4c741c0e72a04b1d1'
)
md5sums=(
  '2b08d3b3ccbdbab947556d61c81fa4c4'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}/lfpreviewer" ||
  cd "$srcdir/${pkgname}/lfpreviewer"

  pip install . --root="$pkgdir" --prefix=/usr --no-deps
  pip install ./lfpreviewer-1.0.1-cp311-cp311-linux_x86_64.whl 2>/dev/null ||
    pip install ./lfpreviewer-1.0.1-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl 2>/dev/null || true


  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" >/dev/null 2>&1 ||
  cd "$srcdir/${pkgname}"

  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
  install -Dm755 usr/share/${pkgname}/{lfp,lfpcd,cleaner,scope} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/${pkgname}/{lfp-icons,lfprc} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm755 usr/share/${pkgname}/ocr/ocr.js -t "${pkgdir}/usr/share/${pkgname}/ocr"
  install -Dm644 usr/share/${pkgname}/ocr/package.json -t "${pkgdir}/usr/share/${pkgname}/ocr"
  install -Dm644 usr/share/${pkgname}/ocr/tesseract.js -t "${pkgdir}/usr/share/${pkgname}/ocr"

}

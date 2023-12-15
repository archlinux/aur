# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=4.1.5
pkgrel=1
pkgdesc='A wrapper for the lf file manager with in-terminal media previews, on-exit directory changing and much more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg graphicsmagick openslide ghostscript bat fzf dunst dialog xsel lolcat python3 python-docopt python-pillow python-attrs libxres python-setuptools python-pip)
conflicts=(lfp-git)
optdepends=(
  'nodejs: to make use of lfps built in node actions manager'
  'python3: to make use of lfps built in python actions manager'
  )
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'da891835bfca1b925505cc0d26c883cd6ce447e4c2e92f91d12564f70672ccecd4609e618e16a6ec7c6eba031d83490b76de64c4a7ea233decea51476997ceb1'
)
md5sums=(
  '115ed89c25966238e810c5a62eea4a57'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}/lfpreviewer" ||
  cd "$srcdir/${pkgname}/lfpreviewer"

  pip install . --root="$pkgdir" --prefix=/usr --no-deps
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

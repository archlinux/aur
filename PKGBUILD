# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=4.1.2
pkgrel=1
pkgdesc='A wrapper for the lf file manager with in-terminal media previews, on-exit directory changing and much more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg graphicsmagick openslide ghostscript bat fzf dunst dialog xsel lolcat python3 python-docopt python-pillow python-attrs libxres python-setuptools)
conflicts=(lfp-git)
optdepends=(
  'nodejs: to make use of lfps built in node actions manager'
  'python3: to make use of lfps built in python actions manager'
  )
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'cff9e2e67a9881a1f5602f6ada836810ae6b15697719f1dab5e06668bb442bdf29f53885b38be62e7000d33d59754c8bc4c6b3a10dd0653cd69dae5cbeb0977e'
)
md5sums=(
  '0a0fd08d54b031fc0ac4858bdfddfa72'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}/lfpreviewer" ||
  cd "$srcdir/${pkgname}/lfpreviewer"

  pip3 install --user --upgrade --force-reinstall --no-deps setuptools wheel
  python3 ./setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

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

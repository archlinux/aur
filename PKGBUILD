# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=3.0.1
pkgrel=1
pkgdesc='A wrapper for the lf file manager with in-terminal media previews, on-exit directory changing and much more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg graphicsmagick openslide ghostscript bat fzf dunst dialog xsel lolcat python3 python-docopt python-pillow python-attrs)
conflicts=(lfp-git)
optdepends=(
  'nodejs: to make use of lfps built in node actions manager'
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '2bc041dac6a6b263997c2a26cab6639afa4cf1d65165e0e8b4841421ef8541e704b4de341142c795d3ac9de226b96f5628e7d4ba797057793c0472a68e9b8ee8'
  '2c18e75cd1d9fd0023ac74982a561f9281f016257f4fd982de396d05bf5d5f6903c11305e3f6d54dc28c254b48190eba5e49ddee6dee9df18ee512f08ca48027'
  )
md5sums=(
  '302984cb0aefd0e0b20b9dde7250b907'
  'f2f8b1bf6c7cf67ee8519523ecda4ff0'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {

  cd "$srcdir/$pkgname/lfpreviewer"
  python3 setup.py install --root="$pkgdir" --optimize=1

  cd "$srcdir/$pkgname"
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
  install -Dm755 usr/share/${pkgname}/{lfp,lfpcd,cleaner,scope} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/${pkgname}/{lfp-icons,lfprc} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

}

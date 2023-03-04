# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=3.0.0
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, fuzzy-finding and more'
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
  'aa191a2c68a0938cb4c129b0ee40c4967321071ad18cc4445a4f7d54daf2707ee738c556f8ca4b24c2485572c855946a004f9049ed0dadb4aff83d3954bda033'
  '979a87f61eefba8d237c590af8ff465484f0dffbdecbab85fd85806991feff6c4cc68e8acf6238c8164deeb5e4dabbb7c126731655b5f089acfdd1d61a84d484'
  )
md5sums=(
  'fe9f46b1b778e9e8b92d0a3ce4b007b0'
  '926177dc3fd24001a08b4199a5d78426'
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

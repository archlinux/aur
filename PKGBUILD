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
  'd3829a1739b96abed1e823118046cfa9c236bfd02259f8553fff14e18da4370737359481b1ceecc3f06ef417f1e296b5ae533664644505fc4c445574d03d72d5'
  '232d81653dd93c67fa4604724e1214f89082c625d6e20122d947548bc3b2a72a04c68a694c568ae5837f20a9284c45c6010aa202887c755423b1ba9212a08d42'
  )
md5sums=(
  '551e2a3d47652d8590af55d68d47ac3e'
  '2346e578ce16f30f1e08404e38dc947a'
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

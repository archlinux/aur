# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=3.1
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
  'c239cc99402e8f38a6c5867f76e0d5af5bb9cb1d4ef70df7d0182d888432292e014907284aeb30b4fb12b312386e7162a3f5393e880afa91c3fc40c1eca6bb9f'
  '8895cd8b233098ebd7d78d3d4388f79f5c0bf40505d3972174c99420ffecca28d7a378ddac25e0641da57710483cca22014bed59c7a40b4ccae8427890c1c115'
  )
md5sums=(
  'f016f35c8bda55f4cf8de1bcda6fc1b0'
  '00423e28213b2c76aff535545c327edf'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

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

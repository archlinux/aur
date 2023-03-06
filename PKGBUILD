# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=lfp
pkgname=lfp-git
pkgver=3.0.1
pkgrel=1
pkgdesc='A wrapper for the lf file manager with in-terminal media previews, on-exit directory changing and much more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg graphicsmagick openslide ghostscript bat fzf dunst dialog xsel lolcat python3 python-docopt python-pillow python-attrs)
conflicts=(lfp)
optdepends=(
  'nodejs: to make use of lfps built in node actions manager'
  )
source=('git+https://gitlab.com/a4to/lfp.git')
sha256sums=('SKIP')

package() {

  cd "$srcdir/${_pkgname}/lfpreviewer"
  python3 setup.py install --root="$pkgdir" --optimize=1

  cd "$srcdir/${_pkgname}"
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
  install -Dm755 usr/share/${_pkgname}/{lfp,lfpcd,cleaner,scope} -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 usr/share/${_pkgname}/{lfp-icons,lfprc} -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 usr/share/licenses/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${_pkgname}/README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 usr/share/man/man1/${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

}

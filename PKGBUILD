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
  '44d937d6344cf24026d7ea64389598de215a4f3d99718e07f149177c72d0baba601b3f80452cb2579e1bef2652cadcaf0ebc544cbc9f9861dc789d2dd586634f'
  '3a65566705bfe64e3b788b0130bd9bf41b2ddb8e6551f7aaa1cb03ac81bc417c628e604db9f1ede0bbad3a94fde141b6f81bc630957f3bbcbd89ac0a5b721f82'
  )
md5sums=(
  'ff7d4a37ebac849005b4f5a83dc2d769'
  '4207203ab7a493990b8d8c28f19b7e56'
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

# Maintainer: Estela <i at estela dot moe>
# This package patches the Atkinson Hyperlegible font with Nerd Font glyphs,
# it should be replaced with the official Nerd Font version when available.

pkgname=ttf-atkinson-hyperlegible-nerd
pkgver=1.00
_hash_mono=154d50362016cc3e873eb21d242cd0772384c8f9 #mono only
pkgrel=1
pkgdesc='Nerd-font style patched font of the Atkinson Hyperlegible fonts'
arch=(any)
url=https://www.brailleinstitute.org/freefont
_url="https://github.com/googlefonts/$_name"
license=(OFL)
source=("https://github.com/googlefonts/atkinson-hyperlegible-next-mono/archive/$_hash_mono.tar.gz")
sha256sums=('d8b50ca876781ef6c2f0e1dd1a7ed6896a7f7769242e76be901b98c6d7edfafb')
makedepends=('font-patcher') #AUR

build(){
  cd "$srcdir/atkinson-hyperlegible-next-mono-$_hash_mono"
  # patch the fonts
  mkdir output
  # parallel font-patcher
  find fonts/ttf -name '*.ttf' | xargs -I {} -P $(nproc) fontforge -script /usr/share/font-patcher/font-patcher -q --complete --careful --outputdir output/ --makegroups 5 --metrics TYPO "{}"
}

package() {
  cd "$srcdir/atkinson-hyperlegible-next-mono-$_hash_mono"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" output/*.ttf
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

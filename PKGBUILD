# Maintainer: Loïc Bidoux <loic.bidoux@owndata.org>

pkgname=lilyjazz
pkgver=r6.8fa7d55
pkgrel=2
pkgdesc="LilyJAZZ font for LilyPond"
arch=('any')
url="https://github.com/OpenLilyPondFonts"
license=('custom:GPL')
makedepends=('git')
depends=('lilypond')
source=("git+https://github.com/OpenLilyPondFonts/${pkgname}.git")
sha256sums=('SKIP')

lilypond_ver=$(pacman -Qi lilypond | grep -Po '(?<=^Version).*' | sed "s/^\s*: //" | sed "s/\-.*//")

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p $pkgdir/usr/share/lilypond/${lilypond_ver}/fonts
  cp -r $srcdir/$pkgname/svg $pkgdir/usr/share/lilypond/${lilypond_ver}/fonts
  cp -r $srcdir/$pkgname/otf $pkgdir/usr/share/lilypond/${lilypond_ver}/fonts
  cp -r $srcdir/$pkgname/supplementary-files/lilyjazz-chord/lilyjazz-chord.otf $pkgdir/usr/share/lilypond/${lilypond_ver}/fonts/otf
  cp -r $srcdir/$pkgname/supplementary-files/lilyjazz-text/lilyjazz-text.otf $pkgdir/usr/share/lilypond/${lilypond_ver}/fonts/otf

  mkdir -p $pkgdir/usr/share/lilypond/${lilypond_ver}/ly
  cp -r $srcdir/$pkgname/stylesheet/* $pkgdir/usr/share/lilypond/${lilypond_ver}/ly
}


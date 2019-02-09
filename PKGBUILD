# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

pkgname=praat-git
pkgver=r3401.f392d054
pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Doing Phonetics by computer (speech analysis)"
arch=('x86_64' 'i686')
url="http://www.fon.hum.uva.nl/praat/"
license=('GPL')
depends=('gtk2' 'alsa-lib' 'libpulse' 'jack')
makedepends=('git' 'pkg-config' 'gtk2' 'alsa-lib')
optdepends=('ttf-sil-fonts')
provides=('praat')
conflicts=('praat' 'praat-bin')
source=('praat::git+https://github.com/praat/praat.git' "praat.desktop" "praat.xpm" "praat.svg" "praat.1")
sha256sums=('SKIP'
            '94720aedc8e9c9e9d53b3230d79ccaae551b5bc5e6986528664311d55f3cce5a'
            '07abf61475f22f83f0514a8fba1ec7bd3821d2b7f35b1215c1f3e1feb947d74b'
            'db6c7568f6e13b4ce7c37bd9fcf289832867f79ba7d7fc48c4f13f0045ad98f1'
            '21ee03cae45be634c57c167c2dfbdfd9d9b7feadb98e0124413d9426c199e81c')

prepare() {
    cd "$srcdir/${pkgname%-git}"
    cp makefiles/makefile.defs.linux.alsa makefile.defs
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
pwd
  mkdir -p -m 755 $pkgdir/usr/share/{applications,icons/hicolor/scalable/apps,man/man1,pixmaps}
  install -Dm755  "$srcdir/${pkgname%-git}/praat" "$pkgdir/usr/bin/praat"
  install -Dm644 "$srcdir/praat.desktop" "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/praat.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "$srcdir/praat.xpm" "$pkgdir/usr/share/pixmaps/"
  install -m644 "praat.1" "${pkgdir}/usr/share/man/man1/"
}

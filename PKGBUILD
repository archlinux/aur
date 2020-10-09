# Mantainer: Cork

pkgname=dosbox-x-fast-bios-git
pkgver=12155.c5496a1a0
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features, with fastbios on by default"
arch=(i686 x86_64)
url="http://dosbox.sourceforge.net"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg)
conflicts=(dosbox-x-git)
makedepends=(git glu)
optdepends=()
source=(dosbox-x::git://github.com/joncampbell123/dosbox-x.git
        default-to-fast-bios.patch
	dosbox-x.png
	dosbox-x.desktop)

pkgver() {
  cd "$SRCDEST/dosbox-x"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/dosbox-x"
  git apply ../default-to-fast-bios.patch
  sed -i 's/enable-debug=heavy/disable-debug/g' build-debug
  ./build-debug
}

package() {
  cd "$srcdir/dosbox-x"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/dosbox-x.png" \
	"$pkgdir/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "$srcdir/dosbox-x.desktop" \
	"$pkgdir/usr/share/applications/dosbox-x.desktop"
}

sha256sums=('SKIP'
            '4597633a842e60243bd190dbd36f613951aceeb1bd75f3af6229f60ade58f926'
            'caa164f3d17d414733882d29098cb9cd63faddbdd5580a0c30f1173a63c42475'
            '32f290580ec02dedd09908d8a4de10f57b94998f2c1eb597b649208cd87b2d33')

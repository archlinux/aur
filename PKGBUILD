# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=adlmidi-git
pkgver=1.2.6.1.r6.d0a4276
pkgrel=1
pkgdesc="CLI MIDI player using OPL3 emulation"
url="https://bisqwit.iki.fi/source/adlmidi.html"
license=('GPL3' 'GPL2')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('sdl2')
makedepends=('git')
optdepends=('ffmpeg: recording output to video file')
conflicts=(adlmidi)
source=("git://bisqwit.iki.fi/adlmidi.git"
	"adlmidi-git.patch")
sha256sums=('SKIP'
            '606c4d3643ddf2accf445ede3a8f5b7371a6fdc5f9885a8a77aca998a5a0d7c8')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags origin/release | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/adlmidi-git.patch"
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  install -Dm755 "${pkgname%-git}/adlmidi" "$pkgdir/usr/bin/adlmidi"
}

# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>
pkgname=ft2-clone
pkgver=b159
pkgrel=1
epoch=
pkgdesc="A portable Fasttracker II clone written in C."
arch=('x86_64')
url="https://16-bits.org/ft2.php"
license=('BSD')
makedepends=('gcc')
depends=('alsa-lib' 'sdl2')
source=("https://16-bits.org/ft2clone-$pkgver-code.zip")
sha512sums=('3a53ac32a15742eb1d4bacf0c1906cbf96c81e7f13d9bcdd5e6907fb1d393c46353afd7da651148f3e54da866737ad5b5e95cb3edd63579eee3d6a7aedece3af')

build() {
  cd "$srcdir/$pkgname-code"

  # If you're compiling for *SLOW* devices, try adding -DLERPMIX right after gcc
  # This will activate 2-tap linear interpolation mixing (blurrier sound) instead
  # of 3-tap quadratic interpolation mixing (sharper sound)
  gcc -D__LINUX_ALSA__ src/rtmidi/*.cpp src/gfxdata/*.c src/*.c -lSDL2 -lpthread -lasound -lstdc++ -lm -Wshadow -Winit-self -Wall -mno-ms-bitfields -Wno-stringop-truncation -Wno-missing-field-initializers -Wno-unused-result -Wno-strict-aliasing -Wextra -Wunused -Wunreachable-code -Wswitch-default -march=native -mtune=native -O3 -o release/other/ft2-clone
}

package() {
	install -D -m 755 "$srcdir/$pkgname-code/release/other/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-code/src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

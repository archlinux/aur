base_name=sdl2-gamepad-mapper
pkgname=$base_name-git
pkgver=0.0.9.r1.g957a15f
pkgrel=2
pkgdesc="Generate SDL2 Controller mapping strings"
arch=('any')
url="https://gitlab.com/ryochan7/$base_name"
depends=('sdl2' 'qt6-base>=6.4' 'qt6-declarative>=6.4')
makedepends=('cmake' 'git')
source=("git+https://gitlab.com/ryochan7/$base_name")
sha256sums=("SKIP")

pkgver() {
  cd "$base_name"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
  | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$base_name"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$base_name"
  make DESTDIR="${pkgdir}" install
  install -Dm755 sdl2-gamepad-mapper "${pkgdir}/usr/bin/sdl2-gamepad-mapper"
  install -D sdl2-gamepad-mapper.desktop "${pkgdir}/usr/share/applications/sdl2-gamepad-mapper.desktop"
  install -D sdl2-gamepad-mapper.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/sdl2-gamepad-mapper.png"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${base_name}/COPYING"
}

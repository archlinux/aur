# Maintainer: Lukas Sabota <lukas@lwsabota.com>
pkgname=vecx-git
pkgver=v1.0.r11.ga8b2f3f
pkgrel=1
pkgdesc="SDL-based Vectrex console emulator"
arch=('x86' 'x86_64')
url="https://github.com/jhawthorn/vecx"
license=('unknown')
groups=()
depends=(sdl sdl_gfx sdl_image)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
source=('git+https://github.com/jhawthorn/vecx.git')
noextract=()
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  sed -i 's/rom.dat/\/usr\/share\/vecx\/rom.dat/' osint.c
  make
}


package() {
  cd "$srcdir/${pkgname%-git}"
  install -D -m 755 vecx $pkgdir/usr/bin/vecx
  install -D -m 644 rom.dat $pkgdir/usr/share/vecx/rom.dat
}


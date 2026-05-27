pkgname=gsplash-git
pkgver=r24.799229d
pkgrel=1
pkgdesc="A lightweight native SDL2 splash screen wrapper for game launchers."
arch=('x86_64')
url="https://github.com/sortedcord/gsplash"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'ffmpeg')
makedepends=('make' 'git' 'pkgconf')

source=("git+https://github.com/sortedcord/gsplash.git")
sha256sums=('SKIP')

pkgver() {
  cd "gsplash"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "gsplash"
  make
}

package() {
  cd "gsplash"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

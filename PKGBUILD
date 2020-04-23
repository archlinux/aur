# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=venom
_pkgname=Venom
pkgver=0.5.5
pkgrel=1
pkgdesc='a modern Tox client for the Linux desktop'
url='https://github.com/naxuroqa/venom'
arch=(x86_64)
license=('GPL3')
depends=('libgee' 'toxcore' 'gspell' 'xdg-desktop-portal' 'sqlcipher')
optdepends=('noto-fonts-emoji: Emoji font support')
makedepends=('vala' 'meson')

source=("https://github.com/naxuroqa/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('3d6b15ffc4ceaaea15f1552cb86945eeec84243bbd91fd95c084b1fdddefd805f2debe510516867f714eb77089066da0c6249565e22f768e4fcb6346315c04bc')

check() {
  ninja -C build test
}

build() {
  arch-meson $_pkgname-$pkgver build -D b_pie='false'
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

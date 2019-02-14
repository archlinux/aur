# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=venom
_pkgname=Venom
pkgver=0.5.4
pkgrel=2
pkgdesc='a modern Tox client for the Linux desktop'
url='https://github.com/naxuroqa/venom'
arch=(x86_64)
license=('GPL3')
depends=('libgee' 'toxcore' 'gspell' 'xdg-desktop-portal' 'sqlcipher')
optdepends=('noto-fonts-emoji: Emoji font support')
makedepends=('vala' 'meson')

source=("https://github.com/naxuroqa/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('dcf49c2f32832a07a3463a174051cd13dcbafc6e0c016298501920ed7ba837d7c505ca1792181ee2f4f31a98b221b6491979cbb010405684ed1a82510078d9e6')

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

# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=venom-git
pkgver=r1190.f5dd584
pkgrel=1
pkgdesc='a modern Tox client for the Linux desktop'
url='https://github.com/naxuroqa/venom'
arch=(x86_64)
license=('GPL3')
depends=('libgee' 'toxcore' 'gspell' 'xdg-desktop-portal' 'sqlcipher' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good')
optdepends=('noto-fonts-emoji: Emoji font support')
makedepends=('vala' 'meson')
provides=('venom')
conflicts=('venom')

source=("$pkgname::git+https://github.com/naxuroqa/Venom#branch=develop")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

check() {
  ninja -C build test
}

build() {
  arch-meson "$pkgname" build -D b_pie='false'
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et:

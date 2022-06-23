# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=rose-browser-git
pkgver=r107.95a1eae
pkgrel=1
pkgdesc='Minimalist browser based on webkit2 and GTK4.'
arch=('x86_64' 'x86_64_v3')
url='https://github.com/mini-rose/rose'
license=('CUSTOM')
depends=('webkit2gtk-5.0' 'gtk4' 'dmenu' 'xdotool' 'xorg-xprop' 'aria2' 'gst-libav' 'gst-plugins-good')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')
provides=('rose-browser')
conflicts=('rose-browser')
options=(!strip)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make -f makefile -j$(nproc) all
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 rose -t "$pkgdir/usr/bin/"
  install -Dm755 scripts/dmenu_rose.sh "$pkgdir/usr/bin/dmenu_rose"
}

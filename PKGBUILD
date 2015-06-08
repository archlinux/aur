# Maintainer: 2ion <dev@2ion.de>
pkgname=dwm-rinne-git
pkgver=6.24.r17.9adafc9
pkgrel=1
pkgdesc="dwm window manager with a built-in MPD client and more, based on dwm 6.0"
arch=('x86_64' 'i686')
url="https://github.com/2ion/dwm"
license=('MIT')
depends=('libx11' 'libxinerama' 'pango' 'libnotify' 'libmpdclient')
optdepends=(\
  'skippy: exposé-like window overview' \
  'dmenuv-git: provides dmenuv_run which is used as the default run-dialog in config.h')
makedepends=('git')
provides=("${pkgname%-git}" 'dwm')
conflicts=("${pkgname%-git}" 'dwm')
source=('dwm-rinne::git+https://github.com/2ion/dwm.git#branch=rinne')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 dwm "$pkgdir"/usr/bin/dwm
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.mkd"
  install -Dm644 LICENSE "$pkgdir/usr/share/doc/${pkgname%-git}/LICENSE"
  install -d "$pkgdir"/usr/share/dwm
  cp -r resources "$pkgdir"/usr/share/dwm
}

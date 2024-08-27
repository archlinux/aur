# Maintainer: PancakeTAS <pancake@mgnet.work> 

_pkgname=obs-wlroots-screencopy
pkgname=${_pkgname}-git
pkgver=r26.a3f88c1
pkgrel=1
pkgdesc="OBS Studio plugin for efficient screen capture on wlroots-based wayland compositors"
arch=('x86_64')
license=('GPL3')
depends=('obs-studio')
makedepends=('make' 'gcc' 'wayland' 'wayland-protocols' 'wlr-protocols')
source=("git+https://github.com/PancakeTAS/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"  
}

build() {
  cd "$srcdir/$_pkgname"
  make PROD=1
}

package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir/$_pkgname/$_pkgname.so" usr/lib/obs-plugins/$_pkgname.so
}

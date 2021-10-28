# Maintainer: Aren Moynihan <aren@peacevolution.org>
# Based on mms-tng-git by Caleb Fontenot <foley2431 at gmail dot com>

_basename=vvmplayer
pkgname=$_basename-git
pkgver=1.3.r1.gad02bfb
pkgrel=1
pkgdesc="VVM Player is a front end GUI to display, play, and delete visual voicemails"
url="https://gitlab.com/kop316/vvmplayer"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=("gtk3" "libhandy" "gstreamer" "evolution-data-server" "callaudiod" "vvmd")
makedepends=("git" "meson")
provides=($_basename)
conflicts=($_basename)
source=("$_basename::git+https://gitlab.com/kop316/vvmplayer")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_basename"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'  
}

build() {
	cd "$srcdir/$_basename"

	arch-meson "$srcdir/$_basename" build --sysconfdir=/etc
	meson compile -C build
}

package() {
	cd "$srcdir/$_basename"

	meson install -C build --destdir "$pkgdir"
}

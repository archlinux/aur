# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-git
pkgver=3.0.0.r0.g48001a2
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(gtk3 gtk-session-lock wayland pam)
makedepends=(meson git scdoc)
provides=('gtklock')
conflicts=('gtklock')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}

# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-git
pkgver=1.3.4.r0.g4f28d98
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(gtk3 gtk-layer-shell wayland pam)
makedepends=(git scdoc)
provides=('gtklock')
conflicts=('gtklock')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

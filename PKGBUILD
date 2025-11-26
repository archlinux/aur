# Maintainer: Bas Ammerlaan <steelbas@gmail.com>
# Basically copied the PKGBUILD for the gtklock-dpms-module by Adrian Perez de Castro
 
pkgname=gtklock-runshell-module
pkgver=4.0.0
pkgrel=1
pkgdesc='A gtklock module that runs a shell command'
url='https://gitlab.com/wef/gtklock-runshell-module'
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=("gtklock>=${pkgver%%.*}" "gtklock<$(( ${pkgver%%.*} + 1 ))")
makedepends=(meson ninja wayland)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('050414b5c8e5e8a1976032a29243d7faef715d7c7bd3461f83bf7ca1e5781ade')
 
build () {
	rm -rf _build
	arch-meson _build "$pkgname-$pkgver"
	meson compile -C_build
}

package () {
	install -Dm755 _build/runshell-module.so "$pkgdir/usr/lib/gtklock/runshell-module.so"
}
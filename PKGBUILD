# Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>
pkgname=gnome-shell-extension-services-systemd-git
_pkgname=${pkgname%-git}

pkgver=r32.22a73ed
pkgrel=1
pkgdesc="Toggle systemd services on/off from a menu in the gnome shell top panel"
arch=('any')
url="https://github.com/petres/gnome-shell-extension-services-systemd"
license=('GPL3')
depends=('gnome-shell<3.21')
makedepends=('git')
source=("git+https://github.com/petres/gnome-shell-extension-services-systemd")
_gitfolder="services-systemd@abteil.org"
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	glib-compile-schemas "$_gitfolder/schemas/"
}

package() {
    cd "$srcdir/$_pkgname"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
	cp -r "$_gitfolder" "$pkgdir/usr/share/gnome-shell/extensions/"
}

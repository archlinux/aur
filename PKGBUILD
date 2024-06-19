# Maintainer: GreyXor <greyxor@protonmail.com>
pkgname=power-profiles-daemon-git
pkgver=0.21+4+gff79008
pkgrel=1
pkgdesc='Makes power profiles handling available over D-Bus (git development version)'
arch=('x86_64')
url="https://gitlab.freedesktop.org/upower/power-profiles-daemon"
license=(MIT)
depends=(glib2-devel glib2 python-gobject python-shtab python-pylint bash-completion python-dbusmock upower polkit)
checkdepends=(python-dbusmock python-isort umockdev gobject-introspection python-gobject python-mccabe umockdev)
makedepends=(meson git python-argparse-manpage)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --tags | sed 's/-/+/g'
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}

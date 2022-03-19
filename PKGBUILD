# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-symphony-git
_reponame=symphony
pkgver=r264.6b5bf10
pkgrel=1
pkgdesc='A Podman desktop application'
arch=(x86_64)
url=https://github.com/marhkb/symphony
license=(GPL3)
depends=(gtk4 libadwaita podman)
makedepends=(git meson rust)
checkdepends=(appstream-glib)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$_reponame"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$_reponame" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}

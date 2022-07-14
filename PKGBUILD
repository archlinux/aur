# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libipuz-git
pkgver=r222.d6ab97a
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL)
depends=(json-glib)
makedepends=(git meson)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
b2sums=(SKIP)

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	CFLAGS="${CFLAGS} -Wno-error=format-security"

	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}

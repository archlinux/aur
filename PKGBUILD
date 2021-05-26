# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=app-icon-preview
pkgver=2.1.2
pkgrel=2
pkgdesc='Tool for designing applications icons'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/design/app-icon-preview'
license=(GPL3)
depends=(libhandy0)
makedepends=(
	git
	meson
	rust
)
source=(
	"git+${url}.git#tag=${pkgver}"
	"git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd app-icon-preview

	git submodule init
	git config 'submodule.hig.url' "${srcdir}/HIG-app-icons"
	git submodule update
}

build() {
	arch-meson app-icon-preview build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

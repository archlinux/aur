# Maintainer: TheBitStick <thebitstick@tfwno.gf>
pkgname=journable-git
_pkgname=journable
pkgver=0.1.1.r1.4957fc5
pkgrel=1
pkgdesc="A simple bullet journal."
arch=(any)
url="https://gitlab.gnome.org/BjoernDaase/journable"
license=('GPL3')
depends=('gtk3' 'appstream-glib' 'python')
makedepends=('git' 'meson' 'cmake')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
backup=()
options=()
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	meson --prefix=/usr --buildtype=plain journable build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}

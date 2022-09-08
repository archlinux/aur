# Maintainer: Guoyi Zhang
# contributor: FabioLolix

pkgname=notekit
pkgver=2022.09.07
pkgrel=1
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=("x86_64")
url="https://github.com/blackhole89/notekit"
license=("GPL3")
depends=("desktop-file-utils" "clatexmath" "gtkmm3" "gtksourceviewmm>=3.18" "jsoncpp" "zlib")
makedepends=("git" "meson" "fontconfig" "appstream-glib")
source=("git+https://github.com/blackhole89/notekit.git#tag=latest")
sha256sums=('SKIP')

pkgver(){
	cd $srcdir/$pkgname
	printf $(TZ=UTC git log --no-walk --tags --pretty="%cd" --decorate=full --date=format-local:%Y.%m.%d | head -n 1)
#	pkgcommit=$(git rev-list --tags | head -n 1)
}

prepare() {
	cd "${srcdir}/${pkgname}"
	arch-meson . _build
}

build() {
	cd "${srcdir}/${pkgname}"
	ninja -C _build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="${pkgdir}" meson install -C _build
}

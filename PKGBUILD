# Maintainer: Guoyi Zhang
# contributor: FabioLolix

pkgname=notekit
pkgver=r208.844215a
pkgrel=1
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=("x86_64")
url="https://github.com/blackhole89/notekit"
license=("GPL3")
depends=("fontconfig" "clatexmath" "gtkmm3" "gtksourceviewmm>=3.18" "jsoncpp" "zlib")
makedepends=("git" "meson")
_commit=844215a372e91f860830336ca1965ead3c2114ad
source=("git+https://github.com/blackhole89/notekit.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    #git describe --long --tags | sed 's/-/+/g' # latest+0+g844215a 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

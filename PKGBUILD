# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Whemoon Jang <palindrom615@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: Hodong Kim <https://gitlab.com/hodong>

# Note upstream seems to have several build system experiments going on. The
# AUR package nimf-git which upstream endorses uses a branch older
# than the current release with meson in it. I've left some meson stuff in this
# PKGBUILD in case that ever hits a tagged release.

pkgname=nimf
pkgver=1.3.0
pkgrel=2
epoch=1
pkgdesc='a lightweight, fast and extensible input method framework'
arch=(x86_64)
url="https://github.com/hamonikr/$pkgname"
license=(LGPL3)
depends=(gtk3
         libappindicator-gtk3
         libxkbcommon
         libxklavier
         qt5-base
         wayland
         wayland-protocols)
makedepends=(anthy
             gtk-doc
             gtk2
             intltool
             libhangul
             librime
             m17n-db
             m17n-lib
             # meson
             librsvg)
optdepends=(#'brise: Rime schema repository'
            'noto-fonts-cjk: Google Noto CJK fonts')
_archive="$pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.bz2::$url/releases/download/$pkgver/$pkgname-master.tar.bz2")
sha256sums=('543ccaa963a8366d68162887fadf61dc36425a99aad6d3bb075e8b0039ef9ed2')

build() {
	cd "$_archive"
	./autogen.sh
	./configure --prefix /usr
	# arch-meson \
	#     -D with_nimf_qt4=false
	#     "$_archive" build \
	# ninja -C build
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir/" install
	# DESTDIR="$pkgdir/" ninja -C build install
}

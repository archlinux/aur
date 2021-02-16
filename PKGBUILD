# Maintainer: Yiyao Yu <yyudevel at protonmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=3.38.2
pkgrel=1
pkgdesc="GTK3 document viewer, complete features, no gnome dependencies"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'gtk3' 'libgxps' 'libspectre' 'poppler-glib' 'djvulibre' 'gsettings-desktop-schemas' 'gspell' 'libarchive' 'gst-plugins-base-libs' 'libsynctex')
makedepends=('meson' 'ninja' 'itstool' 'texlive-bin' 'intltool' 'docbook-xsl' 'python' 'gtk-doc' 'appstream-glib')
optdepends=('texlive-bin: DVI support'
			'gvfs: for session saving and bookmarking')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "evince-light")
options=('!emptydirs')
source=("https://download.gnome.org/sources/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('27d419d5fed6305e074628edcfde0cb734fffda205d63cac323391c04903bd94')

build() {
	arch-meson "$_pkgname-${pkgver}" build \
		-D ps=enabled \
		-D nautilus=false \
		-D introspection=false \
		-D browser-plugin=false \
		-D thumbnail_cache=disabled \
		-D keyring=disabled
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

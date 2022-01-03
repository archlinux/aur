# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=dynamic-wallpaper-editor
pkgver=2.7
pkgrel=1
pkgdesc='Create or edit XML dynamic wallpapers ("background slideshows") for the GNOME desktop'
arch=(any)
url='https://github.com/maoschanz/dynamic-wallpaper-editor'
license=(GPL3)
depends=(
	python
	hicolor-icon-theme
	dconf
)
makedepends=(
	itstool
	meson
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('00d318eca5950e3ad01c1d52a6bf2488d9bbc2f775f4ec3daa413ede8ec71e346b413e853be5756bb8a632c681860e76d2475408984ed157871bec9ee8e18bbc')

build() {
	arch-meson "${pkgname}-${pkgver}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs || true
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

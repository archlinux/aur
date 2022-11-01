# Maintainer: madmurphy <madmurphy333 AT gmail DOT com>

_extname='nautilus-metadata-editor'
pkgname="${_extname}-git"
pkgver='r61.5dd32b9'
pkgrel=1
pkgdesc='Nautilus extension with simple Metadata Editor'
arch=('i686' 'x86_64')
url="https://github.com/nvlgit/${_extname}-extension"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'taglib')
makedepends=('meson' 'vala')
conflicts=("${_extname}" "${_extname}-bin")
source=("git+https://github.com/nvlgit/${_extname}-extension.git")
install="${_extname}.install"
sha256sums=('SKIP')

pkgver() {
	cd "${_extname}-extension"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_extname}-extension"
	meson builddir --prefix=/usr
	ninja -C builddir
}

package() {
	cd "${srcdir}/${_extname}-extension"
	DESTDIR="$pkgdir" meson install -C builddir
}


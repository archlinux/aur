# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Documentation generator for GObject-based libraries'
pkgname=gi-docgen
pkgver=2021.2
pkgrel=1
url=https://gitlab.gnome.org/ebassi/gi-docgen
license=(GPL)
arch=(any)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
depends=('python-markdown>=3' 'python-markupsafe>=1' 'python-pygments>=2'
         'python-jinja>=2' 'python-toml>=0' 'python-typogrify>=2')
makedepends=(meson ninja)
sha512sums=('1fd0e43781b0984d5431c73aac4ea759b9ea977d09db7588ca43aafa1b22d55efdaf528f097b4feade9ba87c042d268b7c283f2677b9d49d91302e95683e4088')

build () {
	if [[ -d buid ]] ; then
		arch-meson --wipe build "${pkgname}-${pkgver}"
	else
		arch-meson build "${pkgname}-${pkgver}"
	fi
	meson compile -C build
}

package () {
	DESTDIR="${pkgdir}" meson install -C build
}

# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=nautilus-ext-git
_gitname=nautilus-git
pkgver=1.3
pkgrel=1
pkgdesc='Nautilus extension to add important information about the current git directory Edit'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${_gitname}"
depends=('gobject-introspection' 'gtk3' 'python2-nautilus' 'nautilus')
makedepends=('gnome-common' 'meson' 'ninja' 'intltool' 'gettext' 'python')

options=('!emptydirs')
source=("https://github.com/bil-elmoussaoui/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('3c69f2c9fd9f0999d62835714431218b5a3a45a2309ebddb9194374b20b2d514')
provides=("nautilus-git=$pkgver")

prepare(){
	cd "$srcdir/${_gitname}-${pkgver}"
}

build() {
	cd "$srcdir/${_gitname}-${pkgver}"
	meson builddir -Dpost_install=false --prefix=/usr
}

package() {
	cd "$srcdir/${_gitname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C builddir install
}

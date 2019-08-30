# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: trile7 at gmail dot com
# Contributor: Ernia <monghitri@aruba.it>

pkgname=yad-gtk2
pkgver=3.0
pkgrel=1
pkgdesc='A fork of zenity - display graphical dialogs from shell scripts or command line - for gtk2'
url='https://github.com/v1cont/yad'
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gtk2')
provides=('yad')
conflicts=('yad')
makedepends=('intltool')
source=("${pkgname%-gtk2}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('2d97d0216c87be60a62b1e8c2e168c036b21f3d5d68f415dfe2f853cce630ca50660e988c3ba0cd4a5f287eb046abcfbbc2d046d62aaa8a8a32206b6e218467b')

build() {
	cd "${srcdir}/${pkgname%-gtk2}-${pkgver}"

	autoreconf -ivf
	intltoolize
	./configure \
		--prefix=/usr \
		--with-gtk=gtk2 \
		--disable-icon-browser \
		--disable-html \
		--enable-gio \
		--enable-spell \
		--enable-sourceview

	make
}

package() {
	cd "${srcdir}/${pkgname%-gtk2}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}


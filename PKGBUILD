# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Giorgio Gilestro <giorgio@gilest.ro>

pkgbase='nautilus-python'
pkgname='python2-nautilus'
pkgver=1.2.2
pkgrel=3
pkgdesc="Python 2 bindings for the Nautilus Extension API"
arch=('x86_64')
license=('GPL2')
url="https://wiki.gnome.org/Projects/NautilusPython"
depends=('nautilus' 'python2-gobject')
makedepends=('gtk-doc')
conflicts=('python-nautilus')
source=("https://download.gnome.org/sources/${pkgbase}/${pkgver%.*}/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('90cda3fd613ed012214e47c2dc6f814db4e204a5af38e840479819ab9c59f112')

build() {
	cd "${pkgbase}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-gtk-doc PYTHON=python2
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	make -C "${pkgbase}-${pkgver}" DESTDIR="$pkgdir" install
}

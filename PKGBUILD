url="https://github.com/IKRadulov/mate-window-applets"
license=('GPL3')

pkgname="mate-window-applets"
pkgver=1.3.2
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('automake' 'autoconf' 'gettext' 'gobject-introspection')
depends=('python' 'gettext' 'gobject-introspection' 'mate-panel')
source=("https://github.com/IKRadulov/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('061ac44c1dcd16b3feb663dd753c9557d046de98ae4edad80cad37aceff82af1')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix=/usr --disable-schemas-compile

	make

}

package_mate-window-applets() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	./install-icons.sh "${pkgdir}/usr/share" install
}


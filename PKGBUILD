# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

pkgname=seafile-shared
pkgver=4.3.3
pkgrel=1
pkgdesc="Shared components of seafile: seafile-daemon, libseafile, libseafile python bindings, manuals"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haiwen/seafile/"
license=('GPL')
depends=('ccnet>=1.4.2' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'fuse')
makedepends=('vala' 'intltool')
optdepends=()
options=('!libtool' '!emptydirs')
install=seafile-shared.install
source=("https://github.com/haiwen/seafile/archive/v${pkgver}.tar.gz")

build ()
{
	cd "$srcdir/seafile-${pkgver}"
	./autogen.sh
	./configure --disable-server --disable-console --prefix=/usr PYTHON=/usr/bin/python2
	make -j1
}

package ()
{
	cd "${srcdir}/seafile-${pkgver}"
	make DESTDIR="${pkgdir}/" install

	# Remove seafile binary
	rm -rf "${pkgdir}/usr/bin/seafile"
	# Remove cli client binary
	rm -rf "${pkgdir}/usr/bin/seaf-cli"

	install -D -m644 ${srcdir}/seafile-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
sha256sums=('7997b49e78eb621ab8ba6ff7df0be5e02dc3986972a04f8390d0e98bf5fe0bdd')

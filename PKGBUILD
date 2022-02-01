# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=tuxcmd-modules
pkgver=0.6.70
pkgrel=6
pkgdesc='Modules for Tux Commander'
arch=('x86_64')
url='http://tuxcmd.sourceforge.net/'
license=('GPL')
depends=('tuxcmd')
makedepends=('sharutils')
optdepends=('gvfs: for gvfs module')
options=('!docs' '!emptydirs')
source=("https://downloads.sourceforge.net/project/tuxcmd/tuxcmd/tuxcmd-dev-${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        tuxcmd-module-gvfs_include-glib.patch
		tuxcmd-module-libarchive_libarchive-3.0.0a.patch
		tuxcmd-module-ziparchive-gcc-4.7-2.patch
		tuxcmd-module-ziparchive-gcc-4.7.patch)
sha256sums=('22e53951dc8228331c19bf37f90343ba2a6e318f41621ab7f346e3fdaf6f3950'
            'b4555790a57dc0e0a7474be8c42ce624732853bb16c87615f1fdb790ee59dee4'
            '046914669294255af26472f0d15aa28fa9c014002ccfc324675feac3fb48ae71'
            'bf6dd3ae76659832f7dbf8e276d6ba07d22d758e1f190d0fffad21f994940cd9'
            '744bc73a6244cc43622203bfc3d7ce49b4cad940a9d30d844c018c8c55eb3029')

prepare() {
	cd ${pkgname}-${pkgver}
	patch -p1 -i ../tuxcmd-module-gvfs_include-glib.patch
	patch -p1 -i ../tuxcmd-module-libarchive_libarchive-3.0.0a.patch
	patch -p1 -i ../tuxcmd-module-ziparchive-gcc-4.7.patch
	patch -p1 -i ../tuxcmd-module-ziparchive-gcc-4.7-2.patch


	sed -i 's|$(INSTALL) \(.*\) $(DESTDIR)/lib$(LIB_SUFFIX)/tuxcmd/|$(INSTALL) -D \1 $(DESTDIR)/lib/tuxcmd/\1|' */Makefile
}

build() {
	cd ${pkgname}-${pkgver}

	make
}

package() {
	cd ${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}"/usr install
}

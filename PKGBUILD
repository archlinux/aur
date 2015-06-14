# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
pkgname=psi-plus-plugins-git
pkgver=0.15.448
pkgrel=1
pkgdesc="Additional plugins for Psi+"
arch=('i686' 'x86_64')
url="http://psi-plus.com"
license=('GPL2')
depends=('qt4' 'qtwebkit' 'psi-plus-git')
makedepends=('libotr' 'tidyhtml')
optdepends=('libotr: for OTR plugin'
            'tidyhtml: for OTR plugin')
source=('psi-plus-plugins::git://github.com/psi-plus/plugins.git'
        'psiplugin.pri')
md5sums=('SKIP'
         'bbe29ce7c37a0511212798f17993c7dd')

pkgver() {
	cd psi-plus-plugins

	git describe --tags | cut -d - -f 1-2 --output-delimiter=.
}

prepare() {
	cp -v psiplugin.pri psi-plus-plugins/
}

build() {
	cd psi-plus-plugins

	for plugin in generic/* unix/*; do
		cd "$srcdir/psi-plus-plugins/$plugin"
		
		qmake-qt4 PREFIX="/usr" QMAKE_STRIP=
		make
	done
}

package() {
	cd psi-plus-plugins

	for plugin in generic/* unix/*; do
		cd "$srcdir/psi-plus-plugins/$plugin"

		make INSTALL_ROOT="$pkgdir" install
	done
}


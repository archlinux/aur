# Maintainer : Luke Frisken <l.frisken@gmail.com>
pkgname=qprotractor-git
pkgver=v0.0.1
pkgrel=1
_pkgarch=amd64
pkgdesc="Onscreen Protractor"
url="http://http://kibergus.su/en/node/73/"
license=('GPL')
makedepends=('git')
conflicts=('qprotractor-git')
provides=('qprotractor-git')
arch=('i686' 'x86_64')
source=("$pkgname::git://github.com/kellpossible/qProtractor.git#branch=master"
	qprotractor.desktop)
sha256sums=(
	'SKIP'
	'02e14ccb81f12076c2a480451cf30379034f21d8662923a28ee93a09ea8ad6c8'
)

pkgver() {
	cd "$srcdir/go/src/github.com/calmh/syncthing"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$pkgname
	echo Running Qmake...
	echo | ls -la
	qmake-qt4 qprotractor.pro -r -spec linux-g++

	echo Building...
	make

}

package() {
	cd "${srcdir}" 
	install -Dm755 "$srcdir/$pkgname/qprotractor" "${pkgdir}"/usr/bin/qprotractor
	install -Dm644 qprotractor.desktop "${pkgdir}"/usr/share/applications/qprotractor.desktop
	install -Dm644 "$srcdir/$pkgname/logo_small.png" "${pkgdir}"/usr/share/pixmaps/qprotractor.png

	cd "${srcdir}"/${pkgname}
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/qprotractor-git/LICENSE
}
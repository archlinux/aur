# Maintainer: Darcy Hu <hot123tea123@gmail.com>
_pkgname=qmedbrowser
pkgname=qmedbrowser-git
pkgver=r1.4f93e63
pkgrel=1
pkgdesc="A Qt based tool to browse and assign labels/annotations to large number of images"
arch=('x86_64')
url="https://github.com/ntoussaint/qmedbrowser"
license=('MIT')
depends=('qt5-base' 'insight-toolkit')
makedepends=('git' 'cmake')
provides=('qmedbrowser')
conflicts=('qmedbrowser')
source=('qmedbrowser-git::git+https://github.com/ntoussaint/qmedbrowser.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	rm -rf "$srcdir/${pkgname}/build"
	mkdir "$srcdir/$pkgname/build"
	cd "$srcdir/${pkgname}/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/${pkgname}/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	# remove unneeded library file
	rm -fv $pkgdir/usr/lib/libQMedBrowsing.a
}

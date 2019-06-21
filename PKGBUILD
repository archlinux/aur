# Maintainer: Cem Keylan <cem at ckyln dot com>

pkgname=st-ckyln-git
_pkgname=st
pkgrel=1
pkgver=v20190618.4.gec7c036
pkgdesc="Simple Terminal from suckless.org (Fork)"
url="https://git.ckyln.com/cemkeylan/st"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('git')
source=('git+https://git.ckyln.com/cemkeylan/st.git')
md5sums=('SKIP')

provides=('st')
conflicts=('st')

pkgver() {
	cd ${_pkgname}
	git describe --tags | sed 's/-/./g'
}
build() {
	cd $srcdir/${_pkgname}
	make
}

package() {
	cd ${_pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=dps8m-git
_pkgname=dps8m
pkgver=3.1.0.r106.g6fcf7384
pkgrel=1
pkgdesc='Simulator for the Multics dps-8/m mainframe'
arch=('x86_64')
url='http://ringzero.wikidot.com'
license=('ICU')
depends=('libuv')
makedepends=('clang' 'git')
conflicts=('dps8m')
provides=('dps8m')
source=("git+https://gitlab.com/dps8m/dps8m.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^R//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	install -d 755 "${pkgdir}/usr/bin"
	make INSTALL_ROOT="${pkgdir}/usr" install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

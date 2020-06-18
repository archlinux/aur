# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=dps8m-git
_pkgname=dps8m
pkgver=2.0.1_rc2.r5.g377e49d6
pkgrel=1
pkgdesc='Simulator for the Multics dps-8/m mainframe'
arch=('x86_64')
url='http://ringzero.wikidot.com'
license=('ICU')
makedepends=('clang' 'git')
depends=('libuv')
conflicts=('dps8m')
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
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

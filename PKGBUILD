# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=rz608-fix-git
_gitdir=rz608-fix
pkgver=22.05.r2.b88b447
pkgrel=1
pkgdesc="Allows use of the RZ608/MT7921K WiFi module in kernels < 5.17"
arch=('any')
url="https://github.com/ShadowBlip/rz608-fix"
license=('GPL')
groups=()
depends=()
optdepends=()
makedepends=('git')
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${_gitdir}"
	mkdir -p ${pkgdir}/etc
	mkdir -p ${pkgdir}/etc/udev	
	mkdir -p ${pkgdir}/etc/udev/rules.d	
	mkdir -p ${pkgdir}/etc/modprobe.d
	install -m 644 99-rz608.rules ${pkgdir}/etc/udev/rules.d/99-rz608.rules
	install -m 644 rz608.conf ${pkgdir}/etc/modprobe.d/rz608.conf

}

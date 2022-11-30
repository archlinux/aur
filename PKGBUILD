# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=rz608-fix-git
_gitdir=rz608-fix
pkgver=22.11.r3.0a9df20
pkgrel=1
pkgdesc="Allows use of the RZ608/MT7921K WiFi module."
arch=('any')
url="https://github.com/ShadowBlip/rz608-fix"
license=('GPL')
groups=()
depends=()
optdepends=()
makedepends=('git')
_tag=0a9df20dd438cfc4c1760c8d0f562d19e75c0ac7
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git#tag=${_tag}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${_gitdir}"
	mkdir -p ${pkgdir}/etc
	mkdir -p ${pkgdir}/usr/lib/systemd/system-sleep
	install -m644 systemd-suspend-mods.conf ${pkgdir}/etc/systemd-suspend-mods.conf
	install -m744 systemd-suspend-mods.sh ${pkgdir}/usr/lib/systemd/system-sleep/systemd-suspend-mods.sh
}

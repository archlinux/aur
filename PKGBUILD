# Maintainer: Korbinian Schildmann <aur@schildmann.net>
pkgname=thinkcontrol-int-git
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="control thinkpad lights batteries and audio devices (intern git server)"
arch=(x86_64)
url="http://git.int.schildmann.net/kschildmann/thinkcontrol.git"
license=('GPL3')
groups=()
depends=(pamixer libpulse)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(thinkcontrol think)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "${pkgver}_%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/thinkcontrol"
	make build
}

package() {
	cd "${pkgdir}"
	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 ${srcdir}/thinkcontrol/thinkcontrol ${pkgdir}/usr/bin/
	ln -s /usr/bin/thinkcontrol ${pkgdir}/usr/bin/think
}

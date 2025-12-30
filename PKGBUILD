# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
_pkgname="autoaspm"
pkgname="$_pkgname-git"
pkgver=r10.0c73e0e
pkgrel=2
pkgdesc="A script that automatically activates ASPM for all supported devices on Linux"
arch=("any")
url="https://git.notthebe.ee/notthebee/AutoASPM"
license=("unknown")
depends=("pciutils" "python" "which")
makedepends=("git")
provides=("autoaspm=${pkgver}")
conflicts=("autoaspm")
source=($pkgname::git+https://git.notthebe.ee/notthebee/AutoASPM.git $_pkgname.service)
sha256sums=("SKIP" "SKIP")

pkgver() {
	cd $pkgname/
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd $pkgname/
	install -Dm755 pkgs/autoaspm.py $pkgdir/usr/bin/autoaspm.py
	install -Dm644 ../$_pkgname.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service
}

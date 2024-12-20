# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="autoaspm-git"
pkgver=r5.e3bbeb5
pkgrel=1
pkgdesc="A script that automatically activates ASPM for all supported devices on Linux"
arch=("any")
url="https://github.com/notthebee/AutoASPM"
license=("unknown")
depends=("python")
makedepends=("git")
provides=("autoaspm=${pkgver}")
conflicts=("autoaspm")
source=($pkgname::git+https://github.com/notthebee/AutoASPM.git $pkgname.service)
sha256sums=("SKIP" "SKIP")

pkgver() {
	cd $pkgname/
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd $pkgname/
	install -Dm755 autoaspm.py $pkgdir/usr/sbin/autoaspm.py
	install -Dm644 ../$pkgname.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
}

# Maintainer: Jonas Malaco <jonas@protocubo.io>
_pkgbase=liquidtux
pkgname=liquidtux-dkms-git
pkgver=0.1.0.r92.2ceefc1
pkgrel=1
pkgdesc="Linux kernel hwmon drivers for AIO liquid coolers and other devices (DKMS, Git)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/liquidctl/liquidtux"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=("${_pkgbase}" "${_pkgbase-dkms}")
conflicts=("${_pkgbase}" "${_pkgbase-dkms}")
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/liquidctl/liquidtux#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

package() {
	cd "$srcdir/$pkgname"
	make "PKGVER=$pkgver" "DESTDIR=$pkgdir/" dkms_install
}

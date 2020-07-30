# Maintainer: genofire <geno+dev@fireorbit.de>

_pkgname="purple-mm-sms"
pkgname="${_pkgname}-git" # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.1.6.r0.g0b2da5e
pkgrel=1
pkgdesc="Purple SMS plugin using ModemManager"
url="https://source.puri.sm/Librem5/purple-mm-sms"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('libpurple' 'libmm-glib' 'modemmanager')
provides=('purple-mm-sms' 'libpurple-mm-sms' 'purple-mm-sms-git' 'libpurple-mm-sms-git')
conflicts=('purple-mm-sms')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    git -C "$srcdir/${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: robertfoster
# Contributor: <kfgz at interia dot pl>

pkgname=nwipe-git
_pkgname="${pkgname%-git}"
pkgver=0.38.r7.gf594d67
pkgrel=1
pkgdesc="A dwipe fork for securely erasing disks"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-2.0-or-later')
url="https://github.com/martijnvanbrummelen/nwipe"
depends=('hdparm' 'libconfig' 'ncurses' 'parted')
optdepends=('coreutils' 'dmidecode' 'smartmontools')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="${pkgdir}" install
}

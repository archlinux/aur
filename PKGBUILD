# Maintainer: Chris Coggburn <chris+arch at coggburn dot us>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=osinfo-db-git
pkgver=v20181116.r14.gbb0fa57
pkgrel=1
pkgdesc="Osinfo database of information about operating systems for virtualization provisioning tools"
arch=('any')
url="https://libosinfo.org/"
license=('GPL')
makedepends=('osinfo-db-tools' 'intltool')
options=('!emptydirs')
provides=('osinfo-db')
conflicts=('osinfo-db')
source=("osinfo-db-git::git+https://gitlab.com/libosinfo/osinfo-db.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^gpa-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make
}

check() {
  cd "$pkgname"
  make -k check || :
}

package() {
	cd "$pkgname"
	osinfo-db-import --root "$pkgdir" --system osinfo-db-$(date +%Y%m%d).tar.xz
}

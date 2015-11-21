# Maintainer: thr <r at sledinmay dot com>
# Contributor: Kevin Kyzer <kev@k3v.in>
_pkgname=kmuddy
pkgname="$_pkgname-git"
pkgver=20150927
pkgrel=1
pkgdesc="Mud client for KDE4"
arch=(i686 x86_64)
url="http://kmuddy.org"
license=(GPL)
depends=('kdebase-runtime' 'libmxp')
makedepends=('git' 'automoc4' 'cmake')
provides=('kmuddy')
install=$pkgname.install
source=("${_pkgname}::git+https://anongit.kde.org/kmuddy.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/kmuddy"
	git log -1 --format="%cd" --date=short |tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
	cd "${srcdir}/${_pkgname}-build"
	make
}

package() {
	cd "${srcdir}/${_pkgname}-build"
	make DESTDIR=${pkgdir} install
}

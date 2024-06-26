# Maintainer: hendy643 <phenderson643 at gmail dot com>
pkgname=ckermit-git
pkgver=r50.e298984
pkgrel=2
pkgdesc="Portable OPEN SOURCE Scriptable Network and Serial Communication Software for Unix and VMS. git version"
arch=('x86_64')
url="https://github.com/KermitProject/ckermit"
license=('BSD-3-Clause')
depends=('openssl')
provides=('ckermit')
conflicts=('ckermit')
makedepends=('git')
source=("git+https://github.com/KermitProject/ckermit.git")
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/ckermit
	count_commits=$(git rev-list --count HEAD)
	commit=$(git rev-parse --short HEAD)
	echo "r${count_commits}.${commit}"
}

build() {
	cd "${srcdir}/ckermit"
	make linux+ssl
	cp wermit ckermit
}

package() {
	install -D -m755 "${srcdir}/ckermit/ckermit" "$pkgdir/usr/bin/ckermit"
}

# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=mmdebstrap
pkgver=0.8.6
pkgrel=1
epoch=
pkgdesc="create a Debian chroot"
arch=('any')
url="https://gitlab.mister-muffin.de/josch/mmdebstrap"
license=('MIT')
groups=()
depends=('apt' 'python' 'perl')
makedepends=()
checkdepends=()
optdepends=(
	'debian-archive-keyring: Debian PKI support'
	'ubuntu-keyring: Ubuntu PKI support'
	'qemu-user-static: foreign-architecture support'
	'binfmt-qemu-static-all-arch: foreign-architecture support'
	'arch-test: foreign-architecture support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('2cd15f36e5b51ec899af5cf9eaef9db63502e4c1babeb2d0e89e541d5117a15d')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"

	source <(perl -V:vendorarch)
	mkdir -p $pkgdir$vendorarch
	h2ph -d $pkgdir$vendorarch -a syscall.h

	mkdir -p $pkgdir/usr/bin
	cp -a mmdebstrap $pkgdir/usr/bin/mmdebstrap
	cp -a taridshift $pkgdir/usr/bin/mmtaridshift
	cp -a tarfilter $pkgdir/usr/bin/mmtarfilter
	mkdir -p $pkgdir/usr/lib/apt/solvers
	cp -a proxysolver $pkgdir/usr/lib/apt/solvers/mmdebstrap-dump-solution
	mkdir -p $pkgdir/usr/share/mmdebstrap
	cp -a hooks $pkgdir/usr/share/mmdebstrap

	mkdir -p $pkgdir/usr/share/man/man1
	pod2man mmdebstrap > $pkgdir/usr/share/man/man1/mmdebstrap.1
}

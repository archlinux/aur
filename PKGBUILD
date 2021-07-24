# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sean Anderson <seanga2@gmail.com>
_commit=976cc9c1c4cd943cb25ba683902906cb83471fa6
pkgname=mmdebstrap
pkgver=0.7.5
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
sha256sums=('4db7f5fdce5d63af13fdae0892b91d865c6ba56a2e6b32e940780f32102559eb')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver-$_commit"
}

build() {
	cd "$pkgname-$pkgver-$_commit"
}

package() {
	cd "$pkgname-$pkgver-$_commit"

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

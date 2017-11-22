# Maintainer: Roland Ruckerbauer <roland.rucky@gmail.com>
pkgname=msi-keyboard-light-manager
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="MSI keyboard light manager"
arch=('any')
url="https://github.com/ruabmbua/msi_klm"
license=('LGPL')
groups=()
depends=('libusb'
'gtk3')
makedepends=('git'
'tar'
'gzip'
'rustup')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz"
"$pkgname.desktop")
noextract=()
md5sums=('108bcae80b33282f046eed9634be853f'
'2d73d575d7affd6fb5420558206fd793')
validpgpkeys=()

prepare() {
	rustup install stable
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	cp target/release/msi_klm $pkgdir/usr/bin
	cp target/release/msi_klm-gui $pkgdir/usr/bin
	mkdir -p $pkgdir/etc/udev/rules.d
	cp etc/90-msi-epf.rules $pkgdir/etc/udev/rules.d
	mkdir -p $pkgdir/usr/share/applications
	cp ../$pkgname.desktop $pkgdir/usr/share/applications
}

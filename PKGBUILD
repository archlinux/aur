# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.4.5
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl' 'liboping')
makedepends=('cargo')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("99cd767c3d604af8f174f65ffd26656c0bb223fe2400a08cf114017c2347824e3aa18346406538be310996375a861a4e23c8e9b4671785b4a480343f3f004c16")

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nordselect "$pkgdir/usr/bin/nordselect"
	# does not work in package. Run after installation if you want to be able to ping.
	#setcap cap_net_raw+ep "$pkgdir/usr/bin/nordselect"
}


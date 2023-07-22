# Maintainer: Jami Kettunen <jami.kettunen@protonmail.com>

_pkgname="rmtfs"
pkgname="$_pkgname-git"
pkgdesc="Qualcomm Remote Filesystem Service Implementation"
pkgver=r59.7a5ae7e
pkgrel=1
arch=("aarch64")
url="https://github.com/andersson/$_pkgname"
license=("BSD-3-Clause")
groups=("qcom-icnss-wlan")
depends=("qrtr" "libudev.so")
makedepends=("git" "make" "gcc")
provides=("$_pkgname")
source=("git+https://github.com/andersson/$_pkgname.git" "udev.rules")
md5sums=("SKIP" "1e827788992863c3e8562e288f65ee05")

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	make prefix=/usr
}

package() {
	cd "$_pkgname"

	make prefix=/usr DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir"/udev.rules "$pkgdir/usr/lib/udev/rules.d/65-$_pkgname.rules"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}

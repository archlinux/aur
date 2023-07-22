# Maintainer: Jami Kettunen <jami.kettunen@protonmail.com>

_pkgname="qrtr"
pkgname="$_pkgname-git"
pkgdesc="Userspace reference for net/qrtr in the Linux kernel"
pkgver=r95.d0d471c
pkgrel=1
arch=("aarch64")
url="https://github.com/andersson/$_pkgname"
license=("BSD-3-Clause")
groups=("qcom-icnss-wlan")
depends=("glibc")
makedepends=("git" "make" "gcc" "linux-headers")
provides=("$_pkgname")
source=("git+https://github.com/andersson/$_pkgname.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	make prefix=/usr all
}

package() {
	cd "$_pkgname"

	make prefix=/usr DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}

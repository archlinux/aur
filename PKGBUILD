# Maintainer: Jami Kettunen <jami.kettunen@protonmail.com>

_pkgname="pd-mapper"
pkgname="$_pkgname-git"
pkgdesc="Qualcomm Protection Domain mapper"
pkgver=r18.107104b
pkgrel=1
arch=("aarch64")
url="https://github.com/andersson/$_pkgname"
license=("BSD-3-Clause")
groups=("qcom-icnss-wlan")
depends=("qrtr")
makedepends=("git" "make" "gcc")
provides=("$_pkgname")
source=("git+https://github.com/andersson/$_pkgname.git")
md5sums=("SKIP")

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
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}

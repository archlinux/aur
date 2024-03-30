# Maintainer: Sam Day <me@samcday.com>

pkgname="rmtfs"
pkgdesc="Qualcomm Remote Filesystem Service Implementation"
pkgver=1.0
pkgrel=1
arch=(aarch64 x86_64)
url="https://github.com/andersson/rmtfs"
license=("BSD-3-Clause")
depends=(qrtr libudev.so)
makedepends=()
_srcname="${pkgname}-${pkgver}"
source=(
	"${_srcname}.tar.gz::https://github.com/linux-msm/rmtfs/archive/refs/tags/v${pkgver}.tar.gz"
	"udev.rules"
	)
sha256sums=('45e53d4e3d92717bed3b896c871429abe6cfb55230b39b4228323537167834e7'
            '0c2f26d40d9d18e3089c6d836b64231c4f7e0c1ca41686fe7c9d1eb495dc6bbe')

build() {
	cd "$_srcname"

	make prefix=/usr
}

package() {
	cd "$_srcname"

	make prefix=/usr DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir"/udev.rules "$pkgdir/usr/lib/udev/rules.d/65-$pkgname.rules"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

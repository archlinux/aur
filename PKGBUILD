# Maintainer: haagch <christoph.haag@collabora.com>
pkgname=percetto-git
pkgver=v0.1.5.r3.g992ad3f
pkgrel=1
pkgdesc="minimal C wrapper for Perfetto SDK to enable app-specific tracing"
arch=(x86_64)
url="https://github.com/olvaffe/percetto"
license=('apache')
depends=('perfetto')
makedepends=('git' 'meson' 'ninja')
provides=('percetto')
conflicts=('percetto')
options=()
source=("git+https://github.com/olvaffe/percetto.git")
md5sums=("SKIP")

pkgver() {
  cd "percetto"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "percetto"
}

build() {
	cd "percetto"
	meson --prefix=/usr --buildtype=release build -Dperfetto-sdk=/usr/share/perfetto/sdk
	meson compile -C build
}

check() {
	cd "percetto"
	# make -k check
}

package() {
	cd "percetto"
	DESTDIR="$pkgdir/" ninja -C build install
}

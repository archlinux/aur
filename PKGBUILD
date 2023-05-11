_p=unreliablefs

pkgname=fuse-${_p}-git
pkgver=0.2.0
pkgrel=1
pkgdesc="A FUSE-based fault injection filesystem."
arch=(x86_64 aarch64)
url="https://github.com/ligurio/unreliablefs"
license=(MIT)
depends=(fuse)
makedepends=(git)
source=("${_p}::git+$url")
sha256sums=(SKIP)

pkgver() {
	cd $_p
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_p
	cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S .
	make -C build
}

package() {
	cd $_p
	make -C build DESTDIR="${pkgdir}" install
}

# Maintainer: Romain Dal Maso <romain.dalmaso@artefact2.com>
pkgname=hitome-git
pkgver=r100.8469ca3
pkgrel=1
pkgdesc="A quick & dirty system monitor that's light on resources"
arch=('x86_64')
url="https://github.com/artefact2/hitome"
license=('APACHE')
depends=()
optdepends=('nvidia-utils: support monitoring NVIDIA GPUs')
makedepends=('git' 'rust')
provides=('hitome')
conflicts=('hitome')
source=('hitome::git+https://github.com/artefact2/hitome.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/hitome"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/hitome"
	cargo build -r -F nvml
}

package() {
	cd "$srcdir/hitome"
	install -Ds "$srcdir/hitome/target/release/hitome" "$pkgdir/usr/bin/hitome"
}

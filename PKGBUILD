# Maintainer: Navid Yaghoobi <navidys@fedoraproject.org>
pkgname=prometheus-podman-exporter
pkgver=1.13.1
pkgrel=1
pkgdesc="Prometheus exporter for podman environments exposing containers, pods, images, volumes and networks information."
arch=(x86_64)
url="https://github.com/containers/prometheus-podman-exporter"
license=('APACHE-2.0')
depends=('podman>=5')
makedepends=(
	gcc
	btrfs-progs
	git
	go
	glibc
	gcc-libs
	systemd
	gpgme
	device-mapper
	pkgconf
	make
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/containers/prometheus-podman-exporter/archive/v${pkgver}.tar.gz")
sha256sums=("3cadb385d766e96ff077f2f3ce9b7238119b6ac2ee2d27e016d63bac09f4467c")

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
  	export CGO_CFLAGS="${CFLAGS}"
  	export CGO_CXXFLAGS="${CXXFLAGS}"
  	export CGO_LDFLAGS="${LDFLAGS}"
  	export GOFLAGS="-buildmode=pie"
	export GOPATH="${srcdir}"

	cd "$pkgname-$pkgver"
	make binary
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr/bin" install
}

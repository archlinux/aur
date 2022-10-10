# Maintainer: Emmanuel Durand <emmanueldurand@protonmail.com>
pkgname=splash
pkgver=0.9.24
pkgrel=2
pkgdesc="Multi-projector videomapping software, suitable for immersive spaces"
arch=('x86_64')
url="https://sat-mtl.gitlab.io/documentation/splash"
license=('GPL')
depends=(glfw-x11 glm gsl python portaudio snappy zeromq jsoncpp opencv zip)
provides=('$pkgname')
# source=("$pkgname-$pkgver.tag.gz::https://gitlab.com/sat-mtl/tools/splash/splash/-/jobs/artifacts/$pkgver/download?job=package:fullsources:archive")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/sat-mtl/tools/splash/splash/-/jobs/artifacts/package-arch/download?job=package:fullsources")
md5sums=('777467c8b79f1e93a9ea1a848f219215')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    mv "$pkgname.tar.gz" "$pkgname-$pkgver/"
    cd "$pkgname-$pkgver"
    tar xvzf "$pkgname.tar.gz"
    rm "$pkgname.tar.gz"
}

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_LIBS=ON -B build
	make -sC build -j$(nproc)
}

check() {
	cd "$pkgname-$pkgver"
	make check -sC build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install -sC build
}

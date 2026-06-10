# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr
pkgver=0.3.1
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (whatevrd daemon + whatkevr Qt/Kirigami frontend)"
arch=('x86_64' 'aarch64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-grpc' 'qt6-shadertools'
         'kcoreaddons' 'kdbusaddons' 'ki18n' 'kirigami' 'prison' 'kirigami-addons'
         'rlottie' 'sqlite' 'glibc'
         'desktop-file-utils' 'shared-mime-info' 'xdg-utils')
makedepends=('go' 'gcc' 'cmake' 'ninja' 'extra-cmake-modules' 'vulkan-headers')
provides=('whatevrd' 'whatkevr')
conflicts=('whatevr-git' 'whatevr-bin')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c19814999fa463e579c2008e43ba529e5cd81b7e6adcaf6ed283774d03bc640a')

build() {
	make -C "$srcdir/$pkgname-$pkgver" build PREFIX=/usr
}

package() {
	make -C "$srcdir/$pkgname-$pkgver" install PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr
pkgver=0.7.0
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (whatevrd daemon + whatkevr Qt/Kirigami frontend)"
arch=('x86_64' 'aarch64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools'
         'kcoreaddons' 'kdbusaddons' 'ki18n' 'kirigami' 'prison' 'qqc2-desktop-style' 'kirigami-addons'
         'rlottie' 'sqlite' 'glibc'
         'desktop-file-utils' 'shared-mime-info' 'xdg-utils')
makedepends=('go' 'gcc' 'just' 'cmake' 'ninja' 'extra-cmake-modules' 'vulkan-headers')
provides=('whatevrd' 'whatkevr')
conflicts=('whatevr-git' 'whatevr-bin')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('844af08e0f3c0e6e23d3f4e29231d2f2188fce41999721426d7fb1f0a5355202')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	just build-release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	just install /usr "$pkgdir"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

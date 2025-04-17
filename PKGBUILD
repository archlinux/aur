# Maintainer: Andrew Glaze candy@candy123.moe
pkgname=arch-update-notifier
pkgver=0.1.0
pkgrel=1
pkgdesc="Sends a notification to you when you have outdated packages"
arch=('x86_64')
url="https://github.com/Candygoblen123/arch-update-notifier"
license=('GPL-3.0-only')
depends=('glib2' 'glibc' 'gcc-libs')
makedepends=('swift-language' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Candygoblen123/arch-update-notifier/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        swift build \
            -c release \
            --static-swift-stdlib \
            -Xlinker -L-zrelro --verbose
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 ".build/release/arch-update-notifier" "$pkgdir/usr/bin/arch-update-notifier"
}

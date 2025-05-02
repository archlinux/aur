# Maintainer: Andrew Glaze candy@candy123.moe
pkgname=arch-update-notifier
pkgver=0.1.2
pkgrel=1
pkgdesc="Sends a notification to you when you have outdated packages"
arch=('x86_64')
url="https://github.com/Candygoblen123/arch-update-notifier"
license=('GPL-3.0-only')
depends=('glib2' 'glibc' 'gcc-libs')
makedepends=('swift-language' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Candygoblen123/arch-update-notifier/archive/${pkgver}.tar.gz" "arch-update-notifier.service")
sha256sums=('3e9944a4869139dbbe98bb37995715e4b67c5fb7949f132fc63895763b889fe0' '59480ca440a70735142503410286a0707aa1f1c3428e7798ab676d836c010deb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        swift build \
            -c release \
            --static-swift-stdlib
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 ".build/release/arch-update-notifier" "$pkgdir/usr/bin/arch-update-notifier"

        cd "$srcdir"
        install -D -m644 arch-update-notifier.service "${pkgdir}/usr/lib/systemd/user/arch-update-notifier.service"
}

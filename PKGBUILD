# Maintainer: Andrew Glaze candy@candy123.moe
pkgname=arch-update-notifier
pkgver=0.1.1
pkgrel=1
pkgdesc="Sends a notification to you when you have outdated packages"
arch=('x86_64')
url="https://github.com/Candygoblen123/arch-update-notifier"
license=('GPL-3.0-only')
depends=('glib2' 'glibc' 'gcc-libs')
makedepends=('swift-language' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Candygoblen123/arch-update-notifier/archive/${pkgver}.tar.gz" "arch-update-notifier.service")
sha256sums=('3d640f2791422bb65995dd165e4fdda2584dc6149bae48542c0dcdf7de35364b' '514c43f74ecdc46fdabd46f9e3298af92b58d68d4c8d1c7bffc72f32d961172b')

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

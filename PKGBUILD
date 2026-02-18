# Maintainer: Jorge Cardona <jorge@cardona.co>
pkgname=suspiro
pkgver=0.1.68
pkgrel=1
pkgdesc="Push-to-talk voice typing daemon"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/jorgeecardona/suspiro"
license=('MIT')
depends=('glibc' 'alsa-lib' 'whisper.cpp' 'curl')
makedepends=('gcc' 'linux-api-headers' 'alsa-lib' 'whisper.cpp' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 "build/suspiro" "$pkgdir/usr/bin/suspiro"
    install -Dm644 "data/99-uinput.rules" "$pkgdir/usr/lib/udev/rules.d/99-uinput.rules"
    install -Dm644 "data/suspiro-uinput.conf" "$pkgdir/usr/lib/modules-load.d/suspiro-uinput.conf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

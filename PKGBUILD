# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='combaud-git'
pkgver=1.0.r0
pkgrel=2
pkgdesc='Broadcasting audio output from applications to a virtual microphone'
arch=('any')
url='https://github.com/VHSgunzo/combaud'
license=('MIT')
depends=('pulse-native-provider' 'grep' 'sed' 'coreutils' 'gawk')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 'combaud' "$pkgdir/usr/bin/combaud"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'loop-ignore.list' "$pkgdir/etc/combaud/loop-ignore.list"
}

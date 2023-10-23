# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='combaud-git'
pkgver=0.8.r0
pkgrel=1
pkgdesc='Broadcasting audio output from applications to a virtual microphone'
arch=('any')
url='https://github.com/VHSgunzo/combaud'
license=('MIT')
depends=('pipewire' 'grep' 'sed' 'coreutils' 'libpulse' 'gawk')
makedepends=('git')
provides=("$pkgname" "${pkgname%-git}")
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
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/combaud/LICENSE"
}

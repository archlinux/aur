# Maintainer: jkhsjdhjs <jkhsjdhjs at totally dot rip>
pkgname=g930-battery-percentage-git
pkgver=r15.0b1e831
pkgrel=1
pkgdesc="Print battery percentage of a Logitech G930 wireless headset"
arch=('any')
url="https://github.com/Roliga/g930-battery-percentage"
license=('MIT')
depends=('hidapi')
makedepends=('git')
optdepends=('libnotify: g930-battery-notify support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Roliga/g930-battery-percentage.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    mv "$pkgdir/usr/lib/sysusers.d/"{g930-battery,"${pkgname%-git}"}.conf
}

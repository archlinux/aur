# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=wcal-git
pkgver=r4.7db19e4
pkgdesc='ISO weekly calendar'
pkgrel=1
license=('custom:CC0')
arch=("$CARCH")
url='https://github.com/leahneukirchen/wcal'
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    # Use once wcal tags:
    #printf "%s" "$(git describe --all --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make all
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make PREFIX="/usr/" DESTDIR="$pkgdir/" install
}

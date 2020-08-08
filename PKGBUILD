# Maintainer: Leo Pham <forgottenumbrella at tutanota dot com>
pkgname=pa_volume-git
pkgver=0.1.1.r41.8d69373
pkgrel=1
pkgdesc="Set remembered PulseAudio volume"
arch=('x86_64')
url="https://github.com/rhaas80/pa_volume"
license=('GPL')
depends=('libpulse')
makedepends=('git' 'pandoc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rhaas80/pa_volume.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"

    printf "%s.r%s.%s" \
           "$(head -n1 pa_volume.1.md | cut -f3 -d' ')" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make LDFLAGS=-Wl,-z,now
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dt "$pkgdir/usr/bin/" "${pkgname%-git}"
    install -Dt "$pkgdir/usr/share/man/man1/" "${pkgname%-git}.1"
}

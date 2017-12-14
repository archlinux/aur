# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=caps2esc
pkgver=1.0.4
pkgrel=1
pkgdesc="caps2esc: transforming the most useless key ever in the most useful one"
arch=('x86_64')
license=('GPL3')
url="https://github.com/oblitum/caps2esc"
depends=('libevdev')
makedepends=('gcc')
source=("https://raw.githubusercontent.com/oblitum/caps2esc/v${pkgver}/caps2esc.c"
        "https://raw.githubusercontent.com/oblitum/caps2esc/v${pkgver}/LICENSE.md"
        'caps2esc.service')
md5sums=('45e8290bc91e9a297a1496770238d89c'
         '5ce903a740b8b693400618c62409e14d'
         '404cfae39ca29735e26e2c37f93fe6b1')

build() {
    gcc caps2esc.c -o caps2esc -I/usr/include/libevdev-1.0 -levdev -ludev
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m 755 caps2esc "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 444 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "${srcdir}/caps2esc.service" "${pkgdir}/usr/lib/systemd/system"
}

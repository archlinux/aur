# Maintainer: glatavento <glatavento at outlook dot com>

pkgname=isp55e0-git
_pkgname=isp55e0
pkgver=r43.2665a46
pkgrel=1
pkgdesc='An ISP flashing tool for the WCH CH55x, CH579, CH32F103 under linux.'
arch=(x86_64)
depends=('udev')
url='https://github.com/frank-zago/isp55e0'
license=('GPL3')
makedepends=('git' 'libusb')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -m755 -D isp55e0             ${pkgdir}/usr/bin/${_pkgname}
    install -m644 -D 99-wch-isp.rules -t ${pkgdir}/usr/lib/udev/rules.d/
}


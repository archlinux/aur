# Maintainer: theguy147 <theguy (aT) mailbox (dOt) org>
pkgname=crash-git
pkgver=7.2.9.r16.gfdb41f0
pkgrel=1
pkgdesc='Linux kernel crashdump analysis tool. (git version)'
arch=('x86_64')
url="https://github.com/crash-utility/crash"
license=('GPL3')
conflicts=('crash')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    CPPFLAGS='' make
}

package() {
    cd "${pkgname}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./crash
    install -Dm 755 -t "${pkgdir}/usr/share/man/man8" ./crash.8
}
